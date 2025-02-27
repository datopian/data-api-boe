FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./
COPY package.json ./
COPY yarn.lock ./

COPY . .

EXPOSE 3000

RUN yarn
# If you are building your code for production
# RUN npm ci --only=production

RUN ["chmod", "+x", "./curl-wait-for-it.sh"]

RUN ["yarn", "prettier", "--check", "."]

CMD [ "yarn", "start" ]

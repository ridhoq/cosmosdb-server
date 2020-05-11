FROM node:12.16.3-stretch as base

FROM base as build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --production=false --frozen-lockfile 

COPY . .

RUN yarn run build

ENTRYPOINT [ "node", "lib/cli.js" ]
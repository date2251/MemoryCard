FROM node:12.18.3-alpine

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

RUN apk update && npm install -g @vue/cli
COPY package.json .
ENV VUE_APP_API_URL 'https://evening-badlands-62842.herokuapp.com' # TODO: delete
RUN npm install

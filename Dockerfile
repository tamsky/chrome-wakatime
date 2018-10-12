FROM node:alpine

RUN apk add git

RUN git clone https://github.com/tamsky/chrome-wakatime

WORKDIR chrome-wakatime

RUN git checkout tamsky/test-dockerfile


RUN mkdir -p public/js

RUN npm install -g bower --allow-root
RUN npm install -g gulp --allow-root
RUN npm install --allow-root
RUN bower install --allow-root

RUN npm install laravel-elixir-browserify-official --save-dev --allow-root
RUN npm install react@^15.4.2 \
                react-addons-css-transition-group@15.6.2 \
                react-dom@16.5.2 \
                react@^16.0.0 \
                popper.js@^1.14.3
                
RUN gulp

RUN find ./public

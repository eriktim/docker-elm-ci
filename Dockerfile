FROM node:carbon

COPY elm-build.sh /usr/local/bin/elm-build

RUN yarn global add elm elm-test elm-format uglify-js

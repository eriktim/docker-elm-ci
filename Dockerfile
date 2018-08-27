FROM node:8.11.4

COPY elm-build.sh /usr/local/bin/elm-build

RUN yarn global add elm@0.19.0-bugfix2 elm-test@0.19.0-beta4 elm-format@0.8.0 uglify-js@3.4.8

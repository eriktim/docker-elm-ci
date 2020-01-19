FROM node:12.14.1

COPY elm-build.sh /usr/local/bin/elm-build

RUN yarn global add elm@0.19.1-3 elm-test@0.19.1-revision2 elm-format@0.8.2 uglify-js@3.7.5

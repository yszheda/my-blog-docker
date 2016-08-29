FROM alpine:latest


RUN apk update
RUN apk add git python ruby-dev
RUN gem install bundle


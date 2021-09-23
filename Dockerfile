FROM ruby:2.7-alpine

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

WORKDIR /src/lib
COPY . .

RUN apk --update add --no-cache --virtual build_deps make build-base && \
    bundle install && \
    apk del build_deps && \
    apk add --no-cache git nodejs npm

ENTRYPOINT ["jekyll"]

VOLUME /src/pages
EXPOSE 4000
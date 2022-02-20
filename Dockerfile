FROM ruby:3.0.0-alpine

RUN apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  libxml2-dev \
  libxslt-dev \
  build-base \
  nodejs \
  yarn \
  readline \
  postgresql-dev \
  linux-headers \
  readline-dev \
  file \
  imagemagick \
  git \
  tzdata \
  && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN yarn install
RUN bundle install

ENTRYPOINT [ "bin/rails" ]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000

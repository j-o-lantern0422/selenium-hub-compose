FROM ruby:2.4.2

ENV LANG=C.UTF-8 \
  LC_ALL=C.UTF-8 \
  DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -qq \
  build-essential openssl zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

WORKDIR /app

ARG BUNDLE_JOBS=2
ADD . /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install --path vendor/bundle
CMD [ "irb" ]

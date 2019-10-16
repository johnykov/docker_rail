FROM ruby:2.5.6-alpine AS builder

ARG rails_master_key

RUN apk add --no-cache --update \
  tzdata \
  build-base \
  ruby-dev \
  busybox \
  ca-certificates \
  curl \
  curl-dev \
  git \
  graphicsmagick \
  libffi-dev \
  libsodium-dev \
  openssh-client \
  postgresql-dev \
  postgresql-client \
  rsync \
  yarn

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install --without development test
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
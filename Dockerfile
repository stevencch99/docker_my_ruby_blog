FROM ruby:2.7.0
MAINTAINER Steven Chang <stevencch99@gmail.com>

# replace shell with bash so we can source files
# RUN rm /bin/sh && ln -s /bin/bash bin/sh

COPY ./files/etc/apt/apt.conf /etc/apt/apt.conf

ENV RAILS_ENV=production http_proxy=http://172.19.8.10:3128 https_proxy=http://172.19.8.10:3128 SECRET_KEY_BASE=123

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim ghostscript postgis imagemagick nodejs npm

RUN mkdir -p /app
WORKDIR /app

# RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
# RUN apt-get install -y nodejs

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN gem install bundler
# RUN gem install foreman -v 0.85.0
RUN bundle install --verbose --jobs 20 --retry 5

RUN npm install -g yarn && yarn install --check-files

COPY . /app
# RUN ["chmod", "+x", "/app/docker-entrypoint.sh"]
# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# CMD rake db:migrate assets:precompile && puma -C config/puma.rb

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD rails db:setup
CMD rails webpacker:install
CMD rails assets:precompile
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]


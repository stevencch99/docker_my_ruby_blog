FROM ruby:2.7.0-alpine
LABEL Steven Chang <stevencch99@gmail.com>

# copy the proxy setting for the apt tool
# opt 1.
# COPY ./files/etc/apt/apt.conf /etc/apt/apt.conf
# opt 2.
# RUN echo 'Acquire::http::Proxy "http://172.19.8.10:3128";' > /etc/apt/apt.conf

ENV http_proxy=http://172.19.8.10:3128 https_proxy=http://172.19.8.10:3128

RUN apk -U upgrade --no-cache \
    && apk add build-base nodejs npm postgresql-dev git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install --without development test --verbose

RUN npm install -g yarn && yarn install --check-files

COPY . /app
# RUN ["chmod", "+x", "/app/docker-entrypoint.sh"] # omitted this line by commit the file locally

EXPOSE 3000

ENV RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_LOG_TO_STDOUT=true

# ==== these lines might be replaced by the command like:
# docker-compose run app rails db:setup
# docker-compose run app rails webpacker:install
# docker-compose run app rails assets:precompile
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]


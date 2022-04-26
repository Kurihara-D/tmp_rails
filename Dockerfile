FROM --platform=linux/x86_64 ruby:3.1.2
RUN apt-get -qq update && apt-get install -y vim tzdata && \
    mkdir /tmp_rails

WORKDIR /tmp_rails
COPY Gemfile /tmp_rails/Gemfile
COPY Gemfile.lock /tmp_rails/Gemfile.lock
RUN bundle install
COPY . /tmp_rails

# puma.sockの置き場所
RUN mkdir -p tmp/sockets

VOLUME /hr_labo/public
VOLUME /hr_labo/tmp


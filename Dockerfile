FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV APP_HOME /usr/src/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD files/Gemfile $APP_HOME/Gemfile
ADD files/Gemfile.lock $APP_HOME/Gemfile.lock
RUN bundle install -j4
ADD files/. $APP_HOME

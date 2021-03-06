FROM ruby:2.6.6

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install 

ADD . $APP_HOME

EXPOSE 9393

CMD ["bundle", "exec", "shotgun"]
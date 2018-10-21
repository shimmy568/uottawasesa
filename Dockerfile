FROM ruby:2.3.3

EXPOSE 3000

RUN gem install bundler
RUN gem install rails -v 5.0.1
RUN apt update
RUN apt -y install nodejs

WORKDIR /app/
COPY Gemfile .
COPY Gemfile.lock .
RUN bundler install

COPY . .

CMD rails server -e development -b 0.0.0.0 -p 3000

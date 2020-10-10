FROM ubuntu:20.04
FROM ruby:latest
WORKDIR /opt/simple-search
COPY . .
RUN bundle install

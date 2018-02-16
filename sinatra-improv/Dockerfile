FROM ruby

MAINTAINER Joel E White "joelewhite@gmail.com"

RUN gem install sinatra --no-rdoc --no-ri

COPY project/ /root/project/

EXPOSE 4567

ENTRYPOINT ruby /root/project/demo_app.rb -o 0.0.0.0


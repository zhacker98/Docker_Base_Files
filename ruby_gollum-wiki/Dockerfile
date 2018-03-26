FROM ruby

RUN gem install --no-document gollum 

EXPOSE 4567

VOLUME /wiki

WORKDIR /wiki

CMD gollum 

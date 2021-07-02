FROM ruby:2.7.1-alpine3.12

WORKDIR /app
ENV TZ America/Sao_Paulo
ENV LANG "en_C.UTF-8"

RUN apk add --update --no-cache --virtual build-dependencies build-base tzdata postgresql-dev postgresql-client libxslt-dev less shared-mime-info

COPY Gemfile /app/Gemfile

RUN gem install bundler && bundle install --full-index

EXPOSE 3000

CMD ["irb"]

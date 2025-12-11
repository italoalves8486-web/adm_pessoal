FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  nodejs \
  sqlite3 \
  libsqlite3-dev \
  libvips42

WORKDIR /rails

# Copiar GEMFILE E GEMFILE.LOCK
COPY Gemfile Gemfile.lock ./

RUN bundle install

# Copiar restante da aplicação
COPY . .

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

# Usa uma imagem oficial do Ruby com Node e Yarn
FROM ruby:3.2.2

# Instala dependências do SQLite e Node
RUN apt-get update -qq && apt-get install -y nodejs sqlite3

WORKDIR /rails

# Copia e instala as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copia o restante da aplicação
COPY . .

EXPOSE 3000
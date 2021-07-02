source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Serializacao de dados JSON
gem 'active_model_serializers', '~> 0.10.10'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bootsnap', '>= 1.4.2', require: false
# Autenticacao
gem 'devise'
# Gerenciamento de multiplos emails
gem 'devise-multi_email'
# Token JWT
gem 'jbuilder', '~> 2.5'
gem 'jwt'
# Ajusta erro de Cross Origin(CORS)
gem 'rack-cors', require: 'rack/cors'
# Framework
gem 'rails', '~> 6.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Estilizacao de email
gem 'premailer-rails'
# Use Puma as the app server
gem 'puma', '~> 4.3.5'
# Realizar buscas avancadas (filtros)
gem 'ransack', '~> 2.3', '>= 2.3.2'
# Paginacao
gem 'kaminari', '~> 1.2', '>= 1.2.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# CPF and CNPJ validator
gem 'cpf_cnpj'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Geracao de cpf e cnpj validos aleatorios
  gem 'cpf_faker'
  gem 'pry-rails'
  # Mock de objetos para teste
  gem 'factory_bot_rails'
  # Geracao de nomes aletorios
  gem 'faker', '~> 2.15', '>= 2.15.1'
  # Carrega metodos de tesde de controller
  gem 'rails-controller-testing'
  # Suite de testes do rails
  gem 'rspec-rails'
  # Simulacao de datas
  gem 'timecop'
  # Verifica a cobertura de testes do codigo
  gem 'simplecov', require: false
  gem 'simplecov-json', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '2.5.0'
  gem 'webmock'
  gem 'wisper-rspec', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

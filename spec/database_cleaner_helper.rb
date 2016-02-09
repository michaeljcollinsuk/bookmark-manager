require 'database_cleaner'

RSpec.configure do |config|

  # configure :test do
  #   puts 'Test configuration in use'
  #   DataMapper.setup(:default, "sqlite3::memory:")
  #   DataMapper.auto_migrate!
  # end
  #
  # configure :development do
  #   puts 'Development configuration in use'
  #   DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
  #   DataMapper.auto_migrate!
  # end

  config.before(:suite) do
    DataMapper.setup(:test, 'postgres://localhost/bookmark_manager_test')
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

end

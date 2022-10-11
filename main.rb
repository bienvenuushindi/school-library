require_relative 'app'
require_relative 'executor'
def main
  puts 'Welcome to School Library App!'
  app = App.new
  Executor.new(app).launch
end

main

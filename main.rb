require_relative 'app'

def run_option(app, input)
  case input
  when 1
    puts app.list_books
  when 2
    puts app.list_people
  when 3
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:  '
    puts app.create_person(gets.chomp.to_i)
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    puts 'ID of person'
    app.list_rentals(gets.chomp.to_i)
  else
    puts 'Command not found'
  end
end

def execute(app)
  puts ['',
        'Please choose an option by entering a number:',
        '1 - List all books',
        '2 - List all people',
        '3 - Create a person',
        '4 - Create a book',
        '5 - Create a rental',
        '6 - List all rentals for a given person id',
        '7 - Exit']
  input = gets.chomp
  return 'Thank you for using this app!' unless input != 7

  run_option(app, input)
  execute(app)
end

def main
  puts 'Welcome to School Library App!'
  app = App.new
  execute(app)
end

main

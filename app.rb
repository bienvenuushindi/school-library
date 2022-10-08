require_relative './ui/creators/person_creator'
require_relative './ui/creators/teacher_creator'
require_relative './ui/creators/student_creator'
require_relative './ui/creators/book_creator'
require_relative './ui/creators/rental_creator'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    list = []
    @books.to_a.each { |item| list << "Title: \"#{item.title}\" Author #{item.author}" }
    list
  end

  def list_people
    list = []
    if @people.length.positive?
      @people.each do |item|
        list << "[#{item.class}] Name: #{item.name}, ID: #{item.object_id}, Age: #{item.age}"
      end
    end

    list
  end

  def list_rentals(id)
    puts 'Rentals: '
    @rentals.each do |item|
      puts "Date #{item.date}, Book \"#{item.book.title}\" by #{item.person.name}" if item.person.object_id == id
    end
  end

  def create_person(category)
    return 'Command not recognize' unless [1, 2].include? category

    case category
    when 1
      @people << StudentCreator.instance.ask_data.create
    when 2
      @people << TeacherCreator.instance.ask_data.create
    else
      'Choose 1 or 2'
    end
  end

  def create_book
    @books << BookCreator.instance.ask_data.create
  end

  def create_rental
    return puts 'Kindly Add a person before' unless list_people.length.positive?
    return puts 'Kindly Add a book before' unless list_books.length.positive?

    @rentals << RentalCreator.instance.ask_data(list_people, list_books).create(@people, @books)
  end

  def starter
    puts ['',
          'Please choose an option by entering a number:',
          '1 - List all books',
          '2 - List all people',
          '3 - Create a person',
          '4 - Create a book',
          '5 - Create a rental',
          '6 - List all rentals for a given person id',
          '7 - Exit']
    user_input = InputReader.read_integer
    exit unless user_input != 7

    run_option(user_input)
    starter
  end

  def run_option(option)
    case option
    when 1
      puts list_books
    when 2
      puts list_people
    when 3
      puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:  '
      create_person(InputReader.read_integer)
    when 4
      create_book
    when 5
      create_rental
    when 6
      puts 'ID of person'
      list_rentals(InputReader.read_integer)
    else
      puts 'Command not found'
    end
  end

  def exit
    'Thank you for using this app!'
  end

end

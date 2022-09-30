require_relative './classes/student'
require_relative './classes/teacher'
require_relative './association/book'
require_relative './association/rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    list = []
    @books.to_a.each { |item| list << "Title: \"#{item.title}\" Author #{item.author}" }
    list.length.positive? ? list : 'No Element Found'
  end

  def list_people
    list = []
    if @people.length.positive?
      @people.each do |item|
        list << "[#{item.class}] Name: #{item.name}, ID: #{item.object_id}, Age: #{item.age}"
      end
    end

    list.length.positive? ? list : 'No Element Found'
  end

  def list_rentals(id)
    puts 'Rentals: '
    @rentals.each do |item|
      puts "Date #{item.date}, Book \"#{item.book.title}\" by #{item.person.name}" if item.person.object_id == id
    end
  end

  def create_person(category)
    return 'Command not recognize' unless [1, 2].include? category

    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    case category
    when 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      @people << Student.new(age, nil, name, parent_permission: parent_permission)
      'Person created successfully'
    when 2
      print 'Specialization:  '
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name)
      'Person created successfully'
    else
      'Choose 1 or 2'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    return 'Kindly Add a person before' unless list_people.length.positive?
    return 'Kindly Add a book before' unless list_books.length.positive?

    puts 'Select a book from the following list by number '
    list_books.each_with_index do |el, idx|
      puts "#{idx}) #{el}"
    end
    selected_book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people.each_with_index do |el, idx|
      puts "#{idx}) #{el}"
    end
    selected_people_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[selected_book_index], @people[selected_people_index])
    puts 'Rental created successfully'
  end
end

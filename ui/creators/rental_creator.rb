require_relative '../../association/rental'
class RentalCreator < UIReader
  @instance = new
  private_instance_methods :new
  class << self
    attr_reader :instance
  end
  def ask_data(people, books)
    ask_book(books).ask_person(people).ask_date
    self
  end

  def ask_book(books)
    puts 'Select a book from the following list by number '
    books.each_with_index do |el, idx|
      puts "#{idx}) #{el}"
    end
    @book_index = InputReader.read_integer
    self
  end

  def ask_person(people)
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |el, idx|
      puts "#{idx}) #{el}"
    end
    @person_index = InputReader.read_integer
    self
  end

  def ask_date
    print 'Date: '
    @date = InputReader.read_input
    self
  end

  def create(people, books)
    rental = Rental.new(@date, books[@book_index], people[@person_index])
    puts 'Rental created successfully'
    rental
  end
end

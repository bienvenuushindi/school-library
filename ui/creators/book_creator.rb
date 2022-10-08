require_relative '../../association/book'
class BookCreator < UIReader
  @instance = new
  private_instance_methods :new
  class << self
    attr_reader :instance
  end
  def ask_data
    print 'Title: '
    @title = InputReader.read_input
    print 'Author: '
    @author = InputReader.read_input
    self
  end

  def create
    book = Book.new(@title, @author)
    puts 'Book created successfully'
    book
  end
end

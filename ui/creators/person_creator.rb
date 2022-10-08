require_relative '../ui_reader'

class PersonCreator < UIReader
  attr_reader :age, :name

  def ask_data
    print 'Age: '
    @age = InputReader.read_integer
    print 'Name: '
    @name = InputReader.read_input
  end

  protected

  def create
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

require_relative 'person_creator'
require_relative '../../classes/student'
class StudentCreator < PersonCreator
  @instance = new
  private_instance_methods :new

  class << self
    attr_reader :instance
  end

  def ask_data
    super
    print 'Has parent permission? [Y/N]: '
    @parent_permission = InputReader.read_input.downcase == 'y'
    self
  end

  def create
    student = Student.new(@age, nil, @name, parent_permission: @parent_permission)
    puts 'Person created successfully'
    student
  end
end

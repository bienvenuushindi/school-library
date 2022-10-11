require_relative 'person_creator'
require_relative '../../classes/teacher'
class TeacherCreator < PersonCreator
  @instance = new
  private_class_method :new

  class << self
    attr_reader :instance
  end

  def ask_data
    super
    print 'Specialization:  '
    @specialization = InputReader.read_input
    self
  end

  def create
    teacher = Teacher.new(@age, @specialization, @name)
    puts 'Person created successfully'
    teacher
  end
end

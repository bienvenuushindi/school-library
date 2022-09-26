class Student < Person
  def initialize(classroom, age, name)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

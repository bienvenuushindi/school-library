class Person
  def initialize(age, name = 'Unknown', parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id

  attr_accessor :name, :age

  private

  def is_of_age?
    @age > 18
  end

  public

  def can_use_services?
    is_of_age? && @parent_permission
  end
end

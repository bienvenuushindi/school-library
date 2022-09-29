require_relative '../interfaces/nameable'
class Person < Nameable
  attr_reader :id

  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def correct_name
    @name
  end

  def add_rentals(date, book)
    @rentals << Rental.new(date, book, self)
  end

  private

  def of_age?
    @age > 18
  end

  public

  def can_use_services?
    is_of_age? && @parent_permission
  end
end

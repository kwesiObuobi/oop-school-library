class Person
  attr_reader :id, :name, :age
  attr_writer :name, :age

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  def can_use_services?
    of_age?
  end

  private
  def of_age?
    true if @age >= 18
    false
  end
end
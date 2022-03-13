class Human
  attr_accessor :name

  def greeting
    p "Hello #{@name}"
  end
end

human = Human.new
human.name = "Sam"
human.greeting
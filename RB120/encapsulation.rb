
class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny") # changed nickname to "barny"
puts dog.greeting # Displays: Barny says Woof Woof!

# the functionality of #greeting and #change_nickname are hidden.
# the user does not need to know how these are implemented.  This
# convention also makes the @nickname setter method private, so 
# it can still be accessed via the public method #change_nickname,
# but the syntax dog.nickname = ('new name') would not work because
# that raw setter method is hidden behind the private wall
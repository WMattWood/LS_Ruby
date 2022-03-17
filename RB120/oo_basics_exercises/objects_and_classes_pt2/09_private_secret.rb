class Person
  attr_writer :secret

  def share_secret
    puts @secret
  end

  # Can't do this!!! Because it is PRIVATE not PROTECTED.
  # Private methods cannot be accessed via self
  # ----------------------------------------------------
  # def show_my_secret
  #   p self.secret
  # end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

# Can't do this!!! Because it is PRIVATE not PROTECTED.
# Private methods cannot be accessed via self
# ----------------------------------------------------
# person1.show_my_secret
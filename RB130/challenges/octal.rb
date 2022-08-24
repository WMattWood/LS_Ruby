class Octal
  attr_reader :number
  def initialize(number)
    @number = number
  end

  # def to_decimal
  #   return 0 if @number  =~ /[^0-7]/
    
  #   output = 0
  #   @number.chars.reverse.each_with_index do |num, exponent|
  #     output += num.to_i * (8 ** exponent)
  #   end
  #   output
  # end

  def to_decimal
    return 0 if @number  =~ /[^0-7]/
    
    output = 0
    @number.to_i.digits.each_with_index do |num, exponent|
      output += num.to_i * (8 ** exponent)
    end
    output
  end
end







# # class Octal
# #   attr_reader :number
# #   def initialize(number)
# #     @number = number
# #   end

# #   def to_decimal
# #     return 0 unless valid_number?(@number) && valid_octal?(@number)
# #     exp = @number.size - 1
# #     output = 0

# #     @number.chars.each do |num|
# #       output += num.to_i * (8 ** exp)
# #       exp -= 1
# #     end

# #     output
# #   end

# #   private

# #   def valid_number? (number_string)
# #     number_string.chars.all? { |x| x =~ /[0-9]/ }
# #   end

# #   def valid_octal? (number_string)
# #     number_string.chars.all? { |x| x.to_i < 8 }
# #   end
# # end

# # bof = Octal.new('abc1z')
# # puts bof.valid?(bof.number)
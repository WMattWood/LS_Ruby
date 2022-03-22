class Banner
  def initialize(message, size=nil)
    @message = message
    if size && size >= @message.size + 4
      @size = size
    elsif size && size < @message.size + 4
      puts "Size not set: value must be at least 4 greater than message size"
    elsif size && size > 100
      puts "Size not set: value must be at less than 100 characters"
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    @size ? "+-" + '-' * (@size - 2) + "-+" : "+-" + '-' * @message.size + "-+"
  end

  def empty_line
    @size ? "| " + ' ' * (@size - 2) + " |": "| " + ' ' * @message.size + " |"
  end

  def message_line
    if @size
      total_gap = (@size - 2 - @message.size)
      left_gap = total_gap / 2
      if total_gap.even?
        right_gap = total_gap / 2
      else
        right_gap = total_gap / 2 + 1
      end
      "| #{' ' * left_gap}#{@message}#{' ' * right_gap} |"
    else
      "| #{@message} |"
    end
  end
end


banner = Banner.new('To boldly go where no one has gone before.', 100)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+
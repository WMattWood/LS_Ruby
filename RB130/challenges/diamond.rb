class Diamond
  LETTERS = ('A'..'Z').to_a

  class << self

    def make_diamond(letter)
      if letter == 'A'
        'A' + "\n"
      else
        self.first_line(letter) +
        self.middle_lines(letter) +
        self.last_line(letter)
      end
    end
    
    private 

    def first_line(letter)
      index = LETTERS.index(letter)
      whitespace = " " * (index)
      whitespace + 'A' + whitespace + "\n"
    end

    alias_method :last_line, :first_line

    def middle_lines(letter)
      index = LETTERS.index(letter) - 1
      output = []
      self.mirror_step(0, index) do |x, index|
        letter = LETTERS[x + 1]
        output << ((' ' * index) + letter + (' ' * (x * 2 + 1) ) + letter + (' ' * index))
      end
      output.flatten.join("\n") + "\n"
    end

    def mirror_step(start, finish)
      a = start
      b = finish
      start.upto(finish) do
        yield(a, b)
        a += 1
        b -= 1
      end
  
      a = finish
      b = start
      (finish - 1).downto(0) do
        a -= 1
        b += 1
        yield(a, b)
      end
    end

  end
end
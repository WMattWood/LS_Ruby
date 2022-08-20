class Text
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end
end

bof = Text.new(File.read("sample_text.txt"))

puts bof.swap('a', 'e')
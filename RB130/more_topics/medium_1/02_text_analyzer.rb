class TextAnalyzer
  def process(path)
    text = File.open(path) # opens the file, assigns to a local variable
    yield(text.read)       # passes the output of reading the file to the block
    text.close             # closes the file
  end
end

analyzer = TextAnalyzer.new
p analyzer.process('sample_text.txt') { |text| "#{text.split("\n\n").size} paragraphs" }
p analyzer.process('sample_text.txt') { |text| "#{text.split("\n").size} lines" }
p analyzer.process('sample_text.txt') { |text| "#{text.split(' ').size} words" }
class BeerSong
  def self.phrase(num)
    if num == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif num == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif num == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else  
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
  end

  def self.verse(num)
    self.phrase(num)
  end

  def self.verses(x, y)
    nums = x.downto(y).to_a
    verses = nums.map { |num| self.phrase(num) }
    verses.join("\n")
  end

  def self.lyrics
    self.verses(99, 0)
  end
end
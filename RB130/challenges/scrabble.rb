class Scrabble
  SCORESHEET = { %w(A E I O U L N R S T) =>	1,
                %w(D G)                 =>	2,
                %w(B C M P)             =>	3,
                %w(F H V W Y)           =>	4,
                %w(K)                   =>	5,
                %w(J X)                 =>	8,
                %w(Q Z)                 =>	10
              }
  
  def initialize(word)
    @word = word
  end

  def score
    points = 0
    return points unless @word
    letters = @word.chars
    letters.each do |letter|
      SCORESHEET.each_pair do |key, value|
        if key.include?(letter.upcase)
          points += value
          break
        end
      end
    end

    points
  end

  def self.score (word)
    Scrabble.new(word).score
  end
end
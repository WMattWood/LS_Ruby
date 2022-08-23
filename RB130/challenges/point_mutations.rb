class DNA
  attr_reader :strand
  
  def initialize(strand)
    @strand = strand
  end

  def smaller(first, second)
    return second if first.chars.size > second.chars.size
    first
  end

  def bigger(first, second)
    return first if first.chars.size > second.chars.size
    second
  end

  def hamming_distance(other_strand)
    sequence1 = smaller(self.strand, other_strand)
    sequence2 = bigger(self.strand, other_strand)
    hamming_distance = 0
    sequence1.chars.each_with_index do |letter, idx|
      next if letter == sequence2[idx]
      # puts "letter: #{letter} || sequence2[idx] #{sequence2[idx]}"
      hamming_distance += 1
    end

    hamming_distance
  end
end

bof = DNA.new('ABAGA')
bof.hamming_distance('XZYSR')
class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 0
    return 'abundant' if aliquot_sum(number) > number
    return 'perfect' if aliquot_sum(number) == number
    return 'deficient' if aliquot_sum(number) < number
  end

  def self.aliquot_sum(number)
    limit = Math.sqrt(number)
    valid_range = (1..limit).to_a 
  
    output = valid_range.each_with_object([]) do |num, arr|
                if number % num == 0 && !arr.include?(num)
                  arr << num
                  arr << number / num if number / num != num
                end
              end

    output.delete(number)
    output.sum
  end
end
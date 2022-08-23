class RomanNumeral

  STATIC_MAP = { 
    'M'  => 1000,
    'CM' => 900,
    'D'  => 500,
    'CD' => 400,
    'C'  => 100,
    'XC' => 90,
    'L'  => 50,
    'XL' => 40,
    'X'  => 10,
    'IX' => 9,
    'V'  => 5,
    'IV' => 4,
    'I'  => 1
  }

 attr_accessor :number

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_numeral = ''
    while @number > 0
      STATIC_MAP.each_pair do |key, val|
        while @number >= val
          roman_numeral += key
          @number -= val
        end
      end
    end
    roman_numeral
  end
end

#  Local Tests
#  bof = RomanNumeral.new(2001)
#  puts bof.to_roman
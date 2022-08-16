famous_computers = <<~HEREDOC
  Nqn Ybirynpr
  Tenpr Ubccre
  Nqryr Tbyqfgvar
  Nyna Ghevat
  Puneyrf Onoontr
  Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
  Wbua Ngnanfbss
  Ybvf Unvog
  Pynhqr Funaaba
  Fgrir Wbof
  Ovyy Tngrf
  Gvz Orearef-Yrr
  Fgrir Jbmavnx
  Xbaenq Mhfr
  Fve Nagbal Ubner
  Zneiva Zvafxl
  Lhxvuveb Zngfhzbgb
  Unllvz Fybavzfxv
  Tregehqr Oynapu
HEREDOC

LETTERS = ('a'..'z').to_a

def capitalized?(char)
  char.upcase == char
end

def rot_13(char)
  return char if !LETTERS.include?(char.downcase)
  old_index = LETTERS.find_index(char.downcase)
  new_index = ((old_index + 13) % 26)
  capitalized?(char) ? LETTERS[new_index].upcase : LETTERS[new_index]
end

def decrypt(text)
  text.chars.map{ |letter| rot_13(letter) }.join
end

puts decrypt(famous_computers)
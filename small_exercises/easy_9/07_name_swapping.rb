def swap_name(name)
  name = name.split
  "#{name[1]}, #{name[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
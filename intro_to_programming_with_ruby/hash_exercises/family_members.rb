family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

close_family = family.select { |key, val| key == :brothers || key == :sisters }

close_family_array = close_family.values.flatten
print close_family_array


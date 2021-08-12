status = ['awake', 'tired'].sample

sleepy = if status == 'awake'
            "Be productive!"
          else
            "Go to sleep!"
          end

puts sleepy


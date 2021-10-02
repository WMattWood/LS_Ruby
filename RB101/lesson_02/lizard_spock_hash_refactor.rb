require 'yaml'
LIZARD_SPOCK_HASH = YAML.load_file('lizard_spock_chart.yml')

# VALID_CHOICES = ['rock', 'paper', 'scissors']
VALID_CHOICES = %w(rock paper scissors lizard spock)

# METHODS
def prompt(message)
  Kernel.puts("=> #{message}")
end

# this method abstracts the win condition logic
# it returns true if first argument first 'wins' over the second
def win?(first, second)
  LIZARD_SPOCK_HASH[first][second] == 'win'
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("Computer won the round!")
  else
    prompt("It's a tie.")
  end
end

# this method might be unnecessarily future proofed
# my idea was to allow appending letters a-z to an arbitrary set of choices
def list_of_options(arr)
  new_list = []
  alphabet = ('a'..'z').to_a
  arr.each { |item| new_list << "(#{alphabet[arr.index(item)]}) for #{item}" }
  new_list
end

# abandoned the 'arbitrary set' approach here
def user_input_to_choice(user_input)
  case user_input
  when 'a'
    'rock'
  when 'b'
    'paper'
  when 'c'
    'scissors'
  when 'd'
    'lizard'
  when 'e'
    'spock'
  else
    false
  end
end

# WELCOME MESSAGE
prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock.")
prompt("First player to reach 3 points wins the match!")

# LOOP MAIN
loop do
  score = { user: 0, computer: 0 }

  # LOOP MATCH
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{list_of_options(VALID_CHOICES).join(', ')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      elsif user_input_to_choice(choice)
        choice = user_input_to_choice(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice};  Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      score[:user] += 1
    elsif win?(computer_choice, choice)
      score[:computer] += 1
    end
    prompt("USER: #{score[:user]}/3 COMPUTER: #{score[:computer]}/3")

    if score[:user] == 3
      prompt("You win the match!")
      break
    elsif score[:computer] == 3
      prompt("The machines win this time...")
      break
    end
  end
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")

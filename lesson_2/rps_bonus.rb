require "pry"

VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_COMBO = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(paper spock),
  spock: %w(rock scissors)
}

SCORES = {
  player: 0,
  computer: 0
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNING_COMBO[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
    track_scores('player')
  elsif win?(computer, player)
    prompt("Computer won!")
    track_scores('computer')
  else
    prompt("It's a tie!")
  end
end

def track_scores(winner)
  SCORES[winner.to_sym] += 1
end

def five_wins?
  SCORES[:player] == 5 || SCORES[:computer] == 5
end

def display_winner
  puts "----------\n<< FINAL SCORES >>"
  SCORES.each { |k, v| puts "#{k}: #{v}" }
  prompt("The #{SCORES.key(5)} is the winner!")
end

def match_choices(input)
  VALID_CHOICES.select do |choice|
    choice.start_with?(input)
  end
end

prompt("Let's play!")
prompt("First to score 5 points wins!")
prompt("NOTE: You may type the first 1-2 letters of each choice.")

round = 0
loop do
  round += 1
  puts "----------\nRound #{round}"

  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = match_choices(gets.chomp.downcase)

    if choice.length == 1
      break
    elsif choice.length == 2
      prompt("Please be more specific: sp for spock, or sc for scissors.")
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice[0]}, computer chose #{computer_choice}.")

  display_results(choice[0], computer_choice)

  break if five_wins?
end

display_winner

prompt("Thank you for playing. Good bye!")

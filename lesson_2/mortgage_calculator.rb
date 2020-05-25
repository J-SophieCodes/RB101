LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def messages(key, lang='en')
  MESSAGES[lang][key]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts("=> #{message}")
end

def valid_number?(input)
  /\d/.match(input) && /^\d*\.?\d*?$/.match(input) && input.to_f > 0
end

def mortgage_calculator(loan, rate, months)
  (loan * (rate / (1 - (1 + rate)**(-months)))).round(2)
end

prompt('welcome')

loop do # main loop
  loan_amount = '' # loan amount
  loop do
    prompt('loan_amount')
    loan_amount = gets.chomp

    if valid_number?(loan_amount)
      break
    else
      prompt('invalid_num')
    end
  end

  annual_rate = '' # Annual Percentage Rate
  loop do
    prompt('annual_rate')
    annual_rate = gets.chomp

    if valid_number?(annual_rate)
      break
    else
      prompt('invalid_num')
    end
  end

  loan_years = '' # loan duration in years
  loop do
    prompt('loan_years')
    loan_years = gets.chomp

    if valid_number?(loan_years)
      break
    else
      prompt('invalid_num')
    end
  end

  prompt('calculating')

  loan_amount = loan_amount.to_f
  monthly_rate = annual_rate.to_f / 12 / 100
  loan_months = (loan_years.to_f * 12).ceil(0)
  monthly_payment = mortgage_calculator(loan_amount, monthly_rate, loan_months)

  puts "Your monthly payment is $#{monthly_payment}."

  prompt('again')
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt('thanks')

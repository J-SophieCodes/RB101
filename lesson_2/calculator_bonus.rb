LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(key, lang='en')
  MESSAGES[lang][key]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def valid_number?(input)
  # input.to_f.to_s == input || input.to_f.to_s == input+'.0'
  /\d/.match(input) && /^\d*\.?\d*?$/.match(input) # best
  # Integer(input) rescue false || Float(input) rescue false
end

def operation_to_message(op)
  message = case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end

  # some other code

  message
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

puts "Hi #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt('first_num')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt('invalid_num')
    end
  end

  number2 = ''
  loop do
    prompt('second_num')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt('invalid_num')
    end
  end

  prompt('operator_prompt')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator')
    end
  end

  puts "#{operation_to_message(operator)} the two numbers..."

  result =  case operator
            when '1'
              number1.to_f() + number2.to_f()
            when '2'
              number1.to_f() - number2.to_f()
            when '3'
              number1.to_f() * number2.to_f()
            when '4'
              number1.to_f() / number2.to_f()
            end

  puts "The result is #{result}!"

  prompt('again')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('bye')

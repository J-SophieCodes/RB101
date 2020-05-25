# PSEUDO CODE
# Ask for two numbers
# Ask for operation to perform on numbers
# Perform operation
# Print result

Kernel.puts("Enter first number: ")
num1 = Kernel.gets().chomp().to_f()

Kernel.puts("Enter second number: ")
num2 = Kernel.gets().chomp().to_f()

Kernel.puts("What operation do you want to perform?\n(add/subtract/multiply/divide) ")
operation = Kernel.gets().chomp()

case operation
when /add/i then result = num1 + num2
when /subtract/i then result = num1 - num2
when /multiply/i then result = num1 * num2
when /divide/i then result = num1 / num2
else 
  puts ">> invalid input"
  return
end

Kernel.puts("The result is ${result}.")
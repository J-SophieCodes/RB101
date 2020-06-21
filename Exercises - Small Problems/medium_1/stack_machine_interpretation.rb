=begin
Description:
A stack is a list of values that grows and shrinks dynamically. 
In ruby, a stack is easily implemented as an Array that just 
uses the #push and #pop methods.

Write a method that implements a miniature 
stack-and-register-based programming language that has the 
following commands:
n     Place a value n in the "register". Do not modify the 
      stack.
PUSH  Push the register value on to the stack. Leave the value 
      in the register.
ADD   Pops a value from the stack and adds it to the register 
      value, storing the result in the register.
SUB   Pops a value from the stack and subtracts it from the 
      register value, storing the result in the register.
MULT  Pops a value from the stack and multiplies it by the 
      register value, storing the result in the register.
DIV   Pops a value from the stack and divides it into the 
      register value, storing the integer result in the register.
MOD   Pops a value from the stack and divides it into the 
      register value, storing the integer remainder of the 
      division in the register.
POP   Remove the topmost item from the stack and place in 
      register
PRINT Print the register value

All operations are integer operations (which is only important 
with DIV and MOD).

Programs will be supplied to your language method via a string 
passed in as an argument. Your program may assume that all 
programs are correct programs; that is, they won't do anything 
like try to pop a non-existent value from the stack, and they 
won't contain unknown tokens.

You should initialize the register to 0.

Problem Definition:
  - input: string 
  - output: integer
  - rules/model:
    - register = current value
    - stack = stack of values to be used to modify the register
      - FIFO
    - all operations work with integers only

Examples / Test Cases:
  minilang('PRINT')
  # 0

  minilang('5 PUSH 3 MULT PRINT')
  # 15

  minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
  # 5
  # 3
  # 8

  minilang('5 PUSH POP PRINT')
  # 5

  minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
  # 5
  # 10
  # 4
  # 7

  minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
  # 6

  minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
  # 12

  minilang('-3 PUSH 5 SUB PRINT')
  # 8

  minilang('6 PUSH')
  # (nothing printed; no PRINT commands)

Data Structure:
  - input: string
  - rules:
    - store register and stack in hash:
      - register: integer
      - stack: array
    - define each command in its own method
    - store input in an array to be parsed item by item

Algorithm:
  - initialize state hash
    - initialize register to 0
    - initialize stack to []
  - parse the commands
    - if int, assign int to register
    - else
      - push => push value to stack
      - add, sub, mult, div, mod, pop
        => pop last value in stack
        => do modification if necessary
        => reassign result to register
      - print => print register value

=end

# Code:
OPERATIONS = {
  add: :+,
  sub: :-,
  mult: :*,
  div: :/,
  mod: :%
}

def register(command, state)
  state[:register] = command rescue empty_stack
end

def push(state)
  state[:stack] << state[:register]
end

def pop(state)
  abort "Oops.. nothing left in stack" if state[:stack].empty?
  state[:stack].pop
end 

def display(state)
  puts state[:register]
end

def calculate(command, state)
  register = state[:register]
  topmost = pop(state)
  [register, topmost].reduce(OPERATIONS[command])
end

def parse_commands(commands, state)
  commands.each do |command|
    case command
    when :push then push(state)
    when :add, :sub, :mult, :div, :mod
      register(calculate(command, state), state)
    when :pop then register(pop(state), state)
    when :print then display(state)
    when (..0), (0..) then register(command, state)
    else 
      puts "Oops.. Invalid token!"
      return
    end
  end
end

def parse_program(program)
  program.downcase.split.map do |command|
    command.to_i.to_s == command ? command.to_i : command.to_sym
  end
end

def minilang(program)
  commands = parse_program(program)

  state = {
    register: 0,
    stack: []
  }

  parse_commands(commands, state)
end

minilang('4 PUSH 5 PUSH 6 MULT PRINT POP PRINT HEY')

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)


# FURTHER EXPLORATION

# Try writing a minilang program to evaluate and print the result
# of this expression:

# (3 + (4 * 5) - 7) / (5 % 3)

# The answer should be 8. This is trickier than it sounds! Note 
# that we aren't asking you to modify the #minilang method; we 
# want you to write a Minilang program that can be passed to 
# #minilang and evaluated.

# program = '3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 4 PUSH 5 MULT SUB ADD DIV PRINT'
# minilang(program)
# 8

# Add some error handling to your method. In particular, have the 
# method detect empty stack conditions, and invalid tokens in the 
# program, and report those. Ideally, the method should return an 
# error message if an error occurs, and nil if the program runs 
# successfully.

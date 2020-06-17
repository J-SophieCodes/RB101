=begin
Description:
Write a method that will take a short line of text, and print 
it within a box.

You may assume that the input will always fit in your terminal 
window.

Problem Definition:
  - input: string
  - output: print to screen
  - rules/model:
    - corners are '+'
    - LS and RS bounded by "|"
    - Top and bottom bounded by "-"
    - 1 line padding above and below string
      - total height = string + 2 blank rows + 2 rows of "-"
    - 1 space padding before and after string
      - total width = string.size + 2 spaces + 2 "|"

Examples / Test Cases:
  print_in_box('To boldly go where no one has gone before.')
  +--------------------------------------------+
  |                                            |
  | To boldly go where no one has gone before. |
  |                                            |
  +--------------------------------------------+

  print_in_box('')
  +--+
  |  |
  |  |
  |  |
  +--+

Data Structure:
  - input: string
  - rules: logic

Algorithm:
  - string.size 

=end

# Code:
def print_in_box(str)
  width = str.size + 2
  top_bottom = "+#{"-" * width}+"
  blank_row = "|#{" " * width}|"

  puts top_bottom
  puts blank_row
  puts "| #{str} |"
  puts blank_row
  puts top_bottom
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

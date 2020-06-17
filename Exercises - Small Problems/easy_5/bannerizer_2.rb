=begin
Description:
Write a method that will take a short line of text, and print 
it within a box.

Truncate the message if it will be too wide to fit inside a 
standard terminal window (80 columns, including the sides of 
the box). For a real challenge, try word wrapping very long 
messages so they appear on multiple lines, but still within a 
box.

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
        - must not exceed 80 columns
        - this means that the string must be sectioned into
          substrings of 80 - 4 = 76 chars

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
  - rules: array

Algorithm:
  - string.size 
  - scan string for patterns of substrings that are within 
    76 chars in total length

=end

# Code:
MAX_SUBSTR_SIZE = 80 - 4

def print_str(str_ary, str_size)
  str_ary.each do |substr|
    puts "| " + substr.ljust(str_size) + " |"
  end
end

def display_box(str_ary, str_size)
  width = str_size + 2
  top_bottom = "+#{"-" * width}+"
  blank_row = "|#{" " * width}|"

  puts top_bottom
  puts blank_row
  print_str(str_ary, str_size)
  puts blank_row
  puts top_bottom
end

def split_str(str)
  str.scan(/.{1,#{MAX_SUBSTR_SIZE-1}}(?:[^'a-z]|$)/)
end

def wrap_in_box(str)
  case str.size <=> MAX_SUBSTR_SIZE
  when -1 then substr_size = str.size
  when 1 then substr_size = MAX_SUBSTR_SIZE
  end

  display_box(split_str(str), substr_size)
end

title = "scan(pattern) → array"
desc = "Both forms iterate through str, matching the pattern (which may be a Regexp or a String). For each match, a result is generated and either added to the result array or passed to the block. If the pattern contains no groups, each individual result consists of the matched string, $&. If the pattern contains groups, each individual result is itself an array containing one entry per group."
wrap_in_box(title)
wrap_in_box(desc)

# +-----------------------+
# |                       |
# | scan(pattern) → array |
# |                       |
# +-----------------------+
# +------------------------------------------------------------------------------+
# |                                                                              |
# | Returns the successor to str. The successor is calculated by incrementing    |
# | characters starting from the rightmost alphanumeric (or the rightmost        |
# | character if there are no alphanumerics) in the string. Incrementing a       |
# | digit always results in another digit, and incrementing a letter results in  |
# | another letter of the same case. Incrementing nonalphanumerics uses the      |
# | underlying character set's collating sequence.                               |
# |                                                                              |
# +------------------------------------------------------------------------------+


# ALTERNATIVE ALGORITHM FOR split_str method
def split_str(str)
  words = str.split

  idx = 0
  words.each_with_object([]) do |word, substr|
    idx += 1 if [substr[idx], word].join(" ").size > MAX_SUBSTR_SIZE
    substr[idx] = [substr[idx], word].join(" ")
  end
end

puts split_str("Both forms iterate through str, matching the pattern (which may be a Regexp or a String). For each match, a result is generated and either added to the result array or passed to the block. If the pattern contains no groups, each individual result consists of the matched string, $&. If the pattern contains groups, each individual result is itself an array containing one entry per group.")

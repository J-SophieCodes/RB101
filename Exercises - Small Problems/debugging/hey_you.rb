=begin
String#upcase! is a destructive method, so why does this code 
print HEY you instead of HEY YOU? Modify the code so that it 
produces the expected output.
=end

# Code
def shout_out_to(name) # method param points to string 'you'
  name.chars.each { |c| c.upcase! } # chars returns a new array

  puts 'HEY ' + name # name still points to 'you'
end

shout_out_to('you') # expected: 'HEY YOU'

# REVISED
def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
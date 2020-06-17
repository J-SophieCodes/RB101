array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
On line 1, array1 is initialized and assigned to an array of 
string objects, created via general delimited syntax.

On line 2, array2 is initialized to an empty array. 

On line 3, 
  - Array#each method is invoked on array1 (enum) with
    a block.
  - With each enumeration, Array#each calls the block, passing 
    the enum item as an argument into the block. Now value
    references the same string object as the enum item.
  - Within the block, the destructive Array#<< method is invoked
    on array2 with value as an argument. The block has
    access to array2 that was initialized in the outer scope, 
    thus mutating array2 permanently. The referenced string 
    object is now appended to array2.
  - At the end, Array#each returns the original array1; array2 
    now references the same string objects as in array1.

ON line 4,
  - Array#each method is invoked on array1 (enum) with
    a block.
  - With each enumeration, Array#each calls the block, passing 
    the enum item as an argument into the block. Now value
    references the same object as the enum item.
  - Within the block, we have a conditional if statement that
    evaluates the return value of the String#start_with? method
    - the String#start_with? method is invoked on value, passing
      in string objects 'C' and 'S' as arguments. Method returns
      true if the referenced string object starts with one
      of the argments given.
    - if the conditional statement evaluates true, then
      value.upcase! is executed
      - here, the destructive String.upcase! method is invoked 
        on the referenced string object, permanently
        mutating all the letters in the string into capital letters
  - At the end, Array#each returns the original array1, which
    would contain the mutated objects 'CURLY', 'SHEMP', and
    'CHICO'.
  
On line 5, array2 is printed to screen. Since array2 references
the same string objects as in array1, array2 will print:
=> Moe 
=> Larry 
=> CURLY 
=> SHEMP 
=> Harpo 
=> CHICO 
=> Groucho 
=> Zeppo
=end
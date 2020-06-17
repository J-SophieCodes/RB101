name = 'Bob'
save_name = name  # save_name points to 'Bob'
name = 'Alice'  # name now points to 'Alice'
puts name, save_name  # => Alice
                      # => Bob

=begin
On line 1, we initialized variable name to string object 'Bob'

On line 2, we initialized variable save_name and pointed it to 
the same object as name ('Bob').

On line 3, we reassigned variable name to string object 'Alice'.

On line 4, variable name and save_name are printed to screen. 
Variable name will print 'Alice', but variable save_name will
print 'Bob' because it is still pointing to that object.
=end


name = 'Bob'
save_name = name  # save_name points to 'Bob'
name.upcase!  # 'Bob' is mutated into 'BOB'
# both name and save_name still point to same object 'BOB'
puts name, save_name  # => BOB 
                      # => BOB

=begin
On line 1, we initialized variable name to string object 'Bob'

On line 2, we initialized variable save_name and pointed it to 
the same object as name ('Bob').

On line 3, we invoked destructive method String#upcase! on the 
string object that variable name points to. So now the string
object 'Bob' is mutated to 'BOB'.

On line 4, variable name and save_name are printed to screen. 
Since both variables name and save_name are pointing to the
mutated string object, 'BOB' and 'BOB' will be printed to screen.
=end

=begin
Description:
Create a simple tip calculator. The program should prompt for a
bill amount and a tip rate. The program must compute the tip 
and then display both the tip and the total amount of the bill.

Problem Definition:
  - input: floats
    - validate?
  - output: print to screen
  - rules/model:
    - calculate tip using bill amount and tip rate
    - calculate bill total with bill amount and tip amount
    - display results

Examples / Test Cases:
  What is the bill? 200
  What is the tip percentage? 15

  The tip is $30.0
  The total is $230.0

Data Structure:
  - input: floats
  - rules: logic

Algorithm:
  - prompt for bill amount
  - prompt for tip rate
  - calculate tip
  - calculate total
  - display results

=end

# Code:
def calculate_tip(bill, rate)
  bill * rate
end

puts "What is the bill? ($)"
bill_amount = gets.to_f

puts "What is the tip percentage? (%)"
tip_rate = gets.to_f/100

tip = calculate_tip(bill_amount, tip_rate)
total = bill_amount + tip

puts "The tip is $" + format("%.2f", tip)
puts "The total is $" + format("%.2f", total)
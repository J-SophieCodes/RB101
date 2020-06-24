=begin
Josh wants to print an array of numeric strings in reverse 
numerical order. However, the output is wrong. Without removing 
any code, help Josh get the expected output.
=end

# Code
arr = ["9", "8", "7", "10", "11"]
arr2 =  arr.sort do |x, y|
          y.to_i <=> x.to_i
        end

p arr2
# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 
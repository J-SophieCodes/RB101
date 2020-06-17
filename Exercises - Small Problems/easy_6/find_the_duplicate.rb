=begin
Description:
Given an unordered array and the information that exactly one 
value in the array occurs twice (every other value occurs 
exactly once), how would you determine which value occurs 
twice? Write a method that will find and return the duplicate 
value that is known to be in the array.

Problem Definition:
  - input:
  - output:
  - rules/model:

Examples / Test Cases:
  find_dup([1, 5, 3, 1]) == 1
  find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
            38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
            14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
            78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
            89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
            41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
            55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
            85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
            40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
            7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

Data Structure:
  - input:
  - rules:

Algorithm:


=end

# Code:

# # METHOD 1
def find_dup(arr)
  arr.sort!.each_with_index do |ele, idx|
    return ele if ele == arr[idx + 1] 
  end
end

# # METHOD 2
def find_dup(arr)
  arr.sort.slice_when { |i, j| i == j }.to_a[1][0]
end

# METHOD 3
def find_dup(arr)
  arr.sort.inject([]) do |ary, ele|
    return ele if ary.last == ele
    ary << ele
  end 
end

# METHOD 4
def find_dup(arr)
  arr.each { |a| return a if arr.index(a) != arr.rindex(a) }
end 

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
            38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
            14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
            78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
            89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
            41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
            55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
            85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
            40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
            7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# # SOLUTION
def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end
=begin
Description:
Bubble Sort is one of the simplest sorting algorithms available. 
It isn't an efficient algorithm, but it's a great exercise for 
student developers. In this exercise, you will write a method 
that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) 
through the Array. On each pass, each pair of consecutive 
elements is compared. If the first of the two elements is 
greater than the second, then the two elements are swapped. 
This process is repeated until a complete pass is made without 
performing any swaps; at that point, the Array is completely 
sorted.

We can stop iterating the first time we make a pass through the 
array without making any swaps; at that point, the entire Array 
is sorted.

For further information, including pseudo-code that demonstrates 
the algorithm as well as a minor optimization technique, see the 
Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts 
that Array using the bubble sort algorithm as just described. 
Note that your sort will be "in-place"; that is, you will mutate 
the Array passed as an argument. You may assume that the Array 
contains at least 2 elements.

Problem Definition:
  - input: array
  - output: mutated, original array
  - rules/model:
    - each round
      - from L to R, compare two elements of array in turn
      - swap elements if first element > second element
    - stop when no swaps required in the entire round
  
Examples / Test Cases:
  array = [5, 3]
  bubble_sort!(array)
  array == [3, 5]

  array = [6, 2, 7, 1, 4]
  bubble_sort!(array)
  array == [1, 2, 4, 6, 7]

  array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
  bubble_sort!(array)
  array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

Data Structure:
  - input: 
  - rules: 

Algorithm:
  Wikipedia optimized pseudocode:
    procedure bubbleSort(A : list of sortable items)
      n := length(A)
      repeat
          newn := 0
          for i := 1 to n - 1 inclusive do
              if A[i - 1] > A[i] then
                  swap(A[i - 1], A[i])
                  newn := i
              end if
          end for
          n := newn
      until n ≤ 1
    end procedure

=end

# Code: the last element of each round is already sorted in place
def bubble_sort!(arr)
  arr.length.downto(2) do |n|
    (1..n-1).each do |i|
      next if arr[i-1] < arr[i]
      arr[i-1], arr[i] = arr[i], arr[i-1]
    end
  end
  arr
end


array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


# SOLUTION - not optimized
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end
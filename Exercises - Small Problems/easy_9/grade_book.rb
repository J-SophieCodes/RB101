=begin
Description:
Write a method that determines the mean (average) of the three 
scores passed to it, and returns the letter value associated 
with that grade.

Numerical Score Letter	 Grade
90 <= score <= 100	      'A'
80 <= score < 90	        'B'
70 <= score < 80	        'C'
60 <= score < 70	        'D'
0 <= score < 60	          'F'

Tested values are all between 0 and 100. There is no need to 
check for negative values or values greater than 100.

Problem Definition:
  - input: 3 integers
  - output: string (letter grade)
  - rules/model:
    - calc average
    - lookup corresponding letter grade
    - note the upper boundaries

Examples / Test Cases:
  get_grade(95, 90, 93) == "A"
  get_grade(50, 50, 95) == "D"

Data Structure:
  - input: integers
  - rules: 
    - average: use logic
    - letter grade: case

Algorithm:


=end

# Code:

def letter_score(result)
  case result
  when 0..59   then 'F' # same as when (0..59).include?(result)
  when 60..69  then 'D'
  when 70..79  then 'C'
  when 80..89  then 'B'
  else              'A'
  end
end    

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3
  letter_score(average)
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
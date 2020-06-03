# Practice Problem 16
=begin

PROBLEM:
- UUID stands for universally unique identifier
- Write a method that returns one UUID when called with no
  parameters.

EXAMPLE / TEST CASE:
- e.g. "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

QUESTIONS FOR CLARIFICATION:
- What are hexidecimal characters?
  Hexidecimal numbering system is a Base-16 system. i.e. there
  are 16 digits: 0-9,a-f

INPUT: none

OUTPUT: string

RULES:
  Explicit requirements:
  - Codes should be packaged within a method.
  - The method shouldn't require parameters.
  - The method should randomly generate each of the hex numbers.
  - The UUID should consist of 32 hex characters.
  Implicit requirements:
  - The output should be a string of the 32 hex numbers,
    broken into 5 sections of lenghts  8-4-4-4-12, separated 
    by dashes.

DATA STRUCTURE / ALGORITHM:
- Set a UUID_SECTION_LENGTHS array constant that defines the
  lengths of each section of the UUID
- Use #map to iterate through UUID_SECTION_LENGTHS while creating 
  a new return array
- Use #times to iterate inner block based on section length
- During each iteration, randomize between 0-15, then convert to
  a string of base-16. Push result into temporary string variable.
- Return the string variable to #map
- Lastly, join the elements of the #map return array into a string
  separated by dashes.
=end

# CODE:
UUID_SECTION_LENGTHS = [8, 4, 4, 4, 12]

def create_uuid
  uuid =  UUID_SECTION_LENGTHS.map do |section_length|
            section = ""
            section_length.times do |i|
              section << rand(16).to_s(16)
            end
            section
          end
  uuid.join("-")
end

# How to properly generate UUID https://tools.ietf.org/html/rfc4122 
# There is SecureRandom#uuid method in Ruby's standard library

# ANSWER:
# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end

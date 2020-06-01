def select_fruit(list)
  fruits = {}
  list_keys = list.keys
  counter = 0

  loop do
    break if counter == list_keys.size

    current_key = list_keys[counter]
    
    if list[current_key] == 'Fruit'
      fruits[current_key] = 'Fruit'
    end

    counter += 1
  end

  fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

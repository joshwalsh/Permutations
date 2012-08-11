testNumber = "321"

class Permutations

  def initialize(number_to_permutate)
    @number_to_permutate = number_to_permutate
  end

  def possibilities
    low_end = find_lowest_possible_value
    high_end = find_highest_possible_value

    matches = []

    (low_end..high_end).each do |value|
      if matches? value
        matches << value
      end
    end

    matches
  end

  def number_of_iterations
    (find_lowest_possible_value..find_highest_possible_value).count
  end

  private

  def matches?(number_to_test)
    test_array = number_as_array(number_to_test)
    match_array = number_as_array(@number_to_permutate)

    match_array.delete_if { |i| test_array.include?(i) }

    match_array.count == 0
  end

  def find_lowest_possible_value
    values = number_as_array @number_to_permutate
    values = values.sort

    array_as_number values
  end

  def find_highest_possible_value
    values = number_as_array @number_to_permutate
    values = values.sort
    values = values.reverse

    array_as_number values
  end

  def number_as_array(number)
    number.to_s.split(//)
  end

  def array_as_number(array)
    array.join()
  end
end

app = Permutations.new(testNumber)
start_time = Time.new
puts "Getting permutations of: " + testNumber
puts "Iterating over " + app.number_of_iterations.to_s + " possibilities"
puts app.possibilities.inspect
finish_time = Time.now
puts "-----"
puts "Time elapsed: " + (finish_time - start_time).to_s
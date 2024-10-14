
#=========TASK 1===========================================
# Output to the console, 30 times “<3 ruby”, each on a new line, the 10th, 20th, and 25th output just “ruby”.
class PrintRuby
  def go_to_itr
    30.times do |index|
      p [10, 20, 25].include?(index + 1) ? "ruby" : "<3 ruby"
    end
  end
end
#=========TASK 2===========================================
# Draw a circle in the console, the diameter/radius of which is set from the console.
class Circle
  attr_accessor :radius

  def initialize(radius)
    @radius = radius.to_i
    @diameter = @radius * 2
  end

  def draw
    arr = Array.new(@diameter) { " " * @diameter }
    length_arr = arr.size - 1
    arr.each_with_index do |val, i|
      x = 0
      y = 0
      y = -length_arr + i
      x = Math.sqrt(((@radius * @radius) - (y * y)).abs).round
      arr[y][x] = "*"
    end
    part_up_right = arr[(length_arr - length_arr / 2), length_arr]
    part_down_left = part_up_right.reverse
    part_right = part_up_right + part_down_left
    part_left = part_right.map(&:reverse)
    result = []
    @diameter.times do |i|
      result.push(part_left[i] + part_right[i])
    end
    puts result
  end
end

#=========TASK 3===========================================
  # Output to the console a matrix with units along the diagonal. The size is set from the console
  # To use the native Matrix class, you need ruby version >=2.6.5
class Matrixx
  require 'matrix'
  def create_matrix(count)
    Array.new(count) { "0" * count }.map.with_index do |cell, i|
      cell[i] = "1"
      puts cell
    end
  end
end

#=========TASK 4===========================================
# Write a recursive method to find the value of key9 in a hash
class SearchingHash
  def search(hash, fkey)
    hash.each do |key, val|
      if key == fkey
        puts "I found #{key} with #{val}"
      else
        search(val, fkey) if val.is_a?(Hash)
      end
    end
  end
end

#=========TASK 5===========================================
# Write a method that takes a string and converts it to CamelCase, ruby_case_underscore and css-case  def formatize(str, type_of_format)
class StringFormatize
    case type_of_format
    when :camel
      puts str.gsub(/\w+/, &:capitalize).delete("^a-zA-Z0-9")
    when :underscore
      puts str.gsub(/\s+/, "_")
    when :css
      puts str.gsub(/\s+/, "-")
    else
      puts "Please enter a valid name for formating: :camel, :underscore or :css"
    end
  end
end

#=========TASK 6===========================================
# Write a method that takes a multidimensional array and a data type, returns an array of these types
class TypeOfArray
  def get_all(arr, type)
#Alternative solution
    # result_arr_of_types = []
    # if type == Array
    #   arr.each do |element|
    #     result_arr_of_types.push(element) if element.instance_of? type
    #   end
    # else
    #   arr.flatten.each do |element|
    #     result_arr_of_types.push(element) if element.instance_of? type
    #   end
    # end
    # return result_arr_of_types
    # p arr
#/Alternative solution
    arr = arr.flatten unless type == Array
    arr.select { |val| val.is_a?(type) }
  end
end
#=========TASKS Starting===========================================
require "readline"

task_number = gets.chomp
while true
  case task_number
  when "1"
    puts "Task" + task_number + ' Print to the console, 30 times "<3 ruby", each on a new line, 10th, 20th, and 25th output simply print "ruby"'

    print_ruby = PrintRuby.new
    print_ruby.go_to_itr
    break
    # end
  when "2"
    puts "Task" + task_number + ' Draw a circle in the console, the diameter/radius of which is set from the console.'
    r = Readline.readline("Input radius >> ", true)
    print_ruby = Circle.new(r.to_i)
    print_ruby.draw
    break
  when "3"
    puts "Task" + task_number + " Print a matrix with units along the diagonal to the console. The size is set from the console."
    value_row_and_col = Readline.readline("Enter a number to determine the matrix size >> ", true)
    print_ruby = Matrixx.new
    print_ruby.create_matrix(value_row_and_col.to_i)
    break
  when "4"
    puts "Task" + task_number + " Write a recursive method to find a key value in a hash"
    hash = { key1: {}, key2: {}, key3: { key4: "str", key5: "str2", key6: { key7: { key8: 1, key9: [2] } } } }
    puts "Your hash " + hash.to_s
    search_key = Readline.readline("Enter the search key in the correct format - key(number) >> ", true)
    print_ruby = SearchingHash.new
    print_ruby.search(hash, search_key.to_sym)
    break
  when "5"
    puts "Task" + task_number + " Write a method that takes a string and converts it to CamelCase, ruby_case_underscore and css-case"
    string_to_formatize = Readline.readline("Enter the string >> ", true)
    type_of_format = Readline.readline("Enter the formatting type one of the values: camel, underscore or css >> ", true)
    print_ruby = StringFormatize.new
    print_ruby.formatize(string_to_formatize, type_of_format.to_sym)
    break
  when "6"
    puts "Task" + task_number + " Write a method that takes a multidimensional array and a data type and returns an array of these types"
    array = [[1, 2, 3, 4, "1"], %w[2 5 10], [111, 222, 333, 444], %w[i love ruby], { key: "value" }, [[405, ["tttttttttttt"]], ["text", 100_000]]]
    puts 'Your array: ' + array.to_s
    type_of_data = Readline.readline("Enter the data type with a capital or small letter>> ", true)
    print_ruby = TypeOfArray.new
    p print_ruby.get_all(array, Object.const_get(type_of_data.capitalize))
    break
  else
    puts "Incorrect or incorrect task number, try entering the task number from 1 to 6"
  end
end

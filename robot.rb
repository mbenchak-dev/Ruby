module RouteOfObject
  def init_route(route_input)
    routes = [{ name: "WEST", is_on: 0 }, { name: "SOUTH", is_on: 0 }, { name: "EAST", is_on: 0 }, { name: "NORD", is_on: 0 }]
    routes.select { |route_items| route_items[:is_on] = 1 if route_items[:name] == route_input }
    return routes
  end
end

class Area
  attr_accessor :count_col, :count_row

  def initialize(count_col = 5, count_row = 6)
    @count_col = count_col.abs
    @count_row = count_row.abs
  end

  def build_area
    area = { x_length: @count_col, y_length: @count_row }
  end
end

class ToyRobot
  include RouteOfObject
  attr_reader :area_for_walking

  def initialize(area_for_walking)
    @data = { x: 0, y: 0, f: "" }
    @area_for_walking = area_for_walking
    @max_position_x = @area_for_walking[:x_length] - 1
    @max_position_y = @area_for_walking[:y_length] - 1
  end

  def place(x_position, y_position, input_route)
    if x_position < @max_position_x
      @data[:x] = x_position
    else
      @data[:x] = @max_position_x
    end
    if y_position < @max_position_y
      @data[:y] = y_position
    else
      @data[:y] = @max_position_y
    end
    @data[:f] = init_route(input_route)
  end

  def to_left
    is_now_index = find_route_index(@data[:f])
    target_index = 0
    if is_now_index >= (@data[:f].size - 1)
      target_index = 0
    else
      target_index = is_now_index + 1
    end
    @data[:f][is_now_index][:is_on] = 0
    @data[:f][target_index][:is_on] = 1
  end

  def to_right
    is_now_index = find_route_index(@data[:f])
    target_index = 0

    if is_now_index <= 0
      target_index = @data[:f].size - 1
    else
      target_index = is_now_index - 1
    end
    @data[:f][is_now_index][:is_on] = 0
    @data[:f][target_index][:is_on] = 1
  end

  def move
    route = get_route_string(@data[:f])
    case route
    when "WEST"
      @data[:x] -= 1
    when "SOUTH"
      @data[:y] -= 1
    when "EAST"
      @data[:x] += 1
    when "NORD"
      @data[:y] += 1
    end
    if @data[:x] == -1 || @data[:y] == -1 || @data[:x] > @max_position_x || @data[:y] > @max_position_y
      puts "OMG - this robot could fall and crash! But don't worry, this time I'll save his life!"
    end
    @data[:x] = 0 if @data[:x] == -1
    @data[:y] = 0 if @data[:y] == -1
    @data[:x] = @max_position_x if @data[:x] > @max_position_x
    @data[:y] = @max_position_y if @data[:y] > @max_position_y
  end

  def report
    x = @data[:x]
    y = @data[:y]
    f = get_route_string(@data[:f])
    puts "->Output #{x}, #{y}, #{f}"
  end

  #=======Helpers==============
  def find_route_index(arr)
    arr.each { |item| return arr.find_index(item) if item[:is_on] == 1 }
  end

  def get_route_string(arr)
    position = find_route_index(arr)
    route = arr[position][:name]
    return route
  end
end

puts "Welcome to the best ToyRobot from Ruby!"
puts 'Please enter size of table for robots walking - {max width X: integer}x{max length Y: integer}, or "Enter" for using default size (5x6) =>'
AREA = gets.chomp
my_area = {}
if AREA.to_i == 0
  my_area = Area.new().build_area
else
  coordinates = AREA.split("x")
  my_area = Area.new(coordinates[0].to_i, coordinates[1].to_i).build_area
end
my_robot = ToyRobot.new(my_area)
puts "Ok, now your PLACE: 0, 0, underfined; Southwest of table"
puts "NOTICE: If the starting position values ​​are larger than the table dimensions, the maximum table dimensions will be applied"
puts 'Please enter initial values of PLACE for your Robot: {X-position: integer} "Enter" {Y-position: integer} "Enter" {Robots route: SOUTH, WEST, EAST or NORD}=>'
X_POSITION = gets.chomp.to_i
Y_POSITION = gets.chomp.to_i
ROUTE = gets.chomp
my_robot.place(X_POSITION, Y_POSITION, ROUTE)
puts "Great, now let's find out what your robot can do!"
puts "Your robot can execute commands such as: to move - 'MOVE', to turn right - 'RIGHT', to turn left - 'LEFT', to find out the location - 'REPORT'"
action = gets.chomp
while action
  case action
  when "MOVE"
    my_robot.move
  when "RIGHT"
    my_robot.to_right
  when "LEFT"
    my_robot.to_left
  when "REPORT"
    my_robot.report
  end
  action = gets.chomp
end

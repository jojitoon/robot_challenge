# frozen_string_literal: true

require './helpers/contants'

# Robot class
# takes exposes the following methods:
# - place(x, y, direction)
# - move
# - left
# - right
# - report
# - execute(command)
# - follow(commands
# Returns a string for the folowing methods:
# report
# execute(command) when command is "REPORT"
# follow(commands) when last command is "REPORT"
class Robot
  include Constants

  attr_reader :x, :y, :direction, :placed

  def initialize(max_x = 5, max_y = 5)
    @x = 0
    @y = 0
    @direction = NORTH
    @placed = false
    @max_x = max_x
    @max_y = max_y
  end

  def place(x_pos, y_pos, direction)
    @x = x_pos
    @y = y_pos
    @direction = direction
    @placed = true
  end

  def move
    return unless @placed

    case @direction
    when NORTH
      @y += 1 if @y < @max_y
    when SOUTH
      @y -= 1 if @y.positive?
    when EAST
      @x += 1 if @x < @max_x
    when WEST
      @x -= 1 if @x.positive?
    end
  end

  def left
    return unless @placed

    @direction = LEFT_DIR[@direction.to_sym]
  end

  def right
    return unless @placed

    @direction = RIGHT_DIR[@direction.to_sym]
  end

  def report
    return unless @placed

    "Output: #{@x},#{@y},#{@direction}"
  end

  def execute(command)
    case command
    when /PLACE/
      perform_place(command)
    when MOVE, LEFT, RIGHT, REPORT
      send(command.downcase)
    end
  end

  def follow(commands)
    commands.take(commands.size - 1).each do |command|
      execute(command)
    end
    execute(commands.last)
  end

  private

  def perform_place(place_string)
    x, y, direction = place_string.split(' ')[1].split(',')
    place(x.to_i, y.to_i, direction)
  end
end

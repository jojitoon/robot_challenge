# frozen_string_literal: true

require 'readline'
require './lib/robot'

command_list = []
done = false
puts "\nEnter the commands below\n"
begin
  while (done == false) && (line = Readline.readline('', true))
    command_list << line
    done = true if line == 'REPORT'
  end

  def run_robot(commands)
    robot = Robot.new(5, 5)
    puts robot.follow(commands)
  end

  run_robot(command_list)
rescue Interrupt
  puts "\nGoodbye!"
  exit
end

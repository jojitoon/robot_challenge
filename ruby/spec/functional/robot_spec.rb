# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Robot Test' do
  describe 'robot follow basic commands' do
    let(:robot) { Robot.new(5, 5) }

    it 'should output 0,1,NORTH' do
      robot.place(0, 0, 'NORTH')
      robot.move
      expect(robot.report).to eq 'Output: 0,1,NORTH'
    end

    it 'should output 0,0,WEST' do
      robot.place(0, 0, 'NORTH')
      robot.left
      expect(robot.report).to eq 'Output: 0,0,WEST'
    end
  end

  describe 'robot excutee commands as array of strings' do
    let(:robot) { Robot.new(5, 5) }

    it 'should output 3,3,NORTH' do
      report = robot.follow(INPUT_A)
      expect(report).to eq 'Output: 3,3,NORTH'
    end
    it 'should output 3,3,NORTH' do
      report = robot.follow(INPUT_B)
      expect(report).to eq 'Output: 2,5,WEST'
    end
  end
end

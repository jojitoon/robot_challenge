# frozen_string_literal: true

module Constants
  NORTH = 'NORTH'
  SOUTH = 'SOUTH'
  EAST = 'EAST'
  WEST = 'WEST'
  PLACE = 'PLACE'
  LEFT = 'LEFT'
  RIGHT = 'RIGHT'
  MOVE = 'MOVE'
  REPORT = 'REPORT'

  LEFT_DIR = {
    NORTH: WEST,
    WEST: SOUTH,
    SOUTH: EAST,
    EAST: NORTH
  }.freeze

  RIGHT_DIR = {
    NORTH: EAST,
    EAST: SOUTH,
    SOUTH: WEST,
    WEST: NORTH
  }.freeze
end

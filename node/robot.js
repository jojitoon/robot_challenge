const { DIRECTIONS, COMMANDS } = require('./utils');

class Robot {
  x = 0;
  y = 0;
  direction = DIRECTIONS.NORTH;
  placed = false;
  constructor(maxX = 5, maxY = 5) {
    this.maxX = maxX;
    this.maxY = maxY;
  }

  place(x, y, direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    this.placed = true;
  }

  move() {
    if (!this.placed) return;
    switch (this.direction) {
      case DIRECTIONS.NORTH:
        if (this.y < this.maxY) {
          this.y++;
        }
        break;
      case DIRECTIONS.EAST:
        if (this.x < this.maxX) {
          this.x++;
        }
        break;
      case DIRECTIONS.SOUTH:
        if (this.y > 0) {
          this.y--;
        }
        break;
      case DIRECTIONS.WEST:
        if (this.x > 0) {
          this.x--;
        }
        break;
    }
  }

  turnLeft() {
    if (!this.placed) return;
    switch (this.direction) {
      case DIRECTIONS.NORTH:
        this.direction = DIRECTIONS.WEST;
        break;
      case DIRECTIONS.EAST:
        this.direction = DIRECTIONS.NORTH;
        break;
      case DIRECTIONS.SOUTH:
        this.direction = DIRECTIONS.EAST;
        break;
      case DIRECTIONS.WEST:
        this.direction = DIRECTIONS.SOUTH;
        break;
    }
  }

  turnRight() {
    if (!this.placed) return;
    switch (this.direction) {
      case DIRECTIONS.NORTH:
        this.direction = DIRECTIONS.EAST;
        break;
      case DIRECTIONS.EAST:
        this.direction = DIRECTIONS.SOUTH;
        break;
      case DIRECTIONS.SOUTH:
        this.direction = DIRECTIONS.WEST;
        break;
      case DIRECTIONS.WEST:
        this.direction = DIRECTIONS.NORTH;
        break;
    }
  }

  report() {
    if (!this.placed) return;
    return `Output: ${this.x},${this.y},${this.direction}`;
  }

  execute(command) {
    if (command.includes(COMMANDS.PLACE)) {
      const [x, y, direction] = command.split(' ')[1].split(',');
      return this.place(x, y, direction);
    }

    switch (command) {
      case COMMANDS.MOVE:
        return this.move();
      case COMMANDS.LEFT:
        return this.turnLeft();
      case COMMANDS.RIGHT:
        return this.turnRight();
      case COMMANDS.REPORT:
        return this.report();
    }
  }
}

module.exports = Robot;

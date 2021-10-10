const Robot = require('./robot');
const readline = require('readline');
const { COMMANDS } = require('./utils');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

console.log('\nEnter the commands below\n');
const lines = [];

reader.on('line', (line) => {
  lines.push(line);
  if (line === COMMANDS.REPORT) {
    reader.close();
  }
});

const runRobot = (intructions) => {
  const robot = new Robot(5, 5);
  intructions.forEach((instruction) => {
    robot.execute(instruction);
  });
  return robot.report();
};

reader.on('close', () => {
  console.log(runRobot(lines));
  process.exit(0);
});

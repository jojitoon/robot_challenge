# Robot Challenge Submission

clone the repository

`git clone https://github.com/jojitoon/robot_challenge.git`

## RUBY

This is the solution of the challenge in Ruby.

Follow the following steps:

- run `cd ruby`
- run `bundle install` to install test dependencies.
- run `rspec` to run the test suite
- run `ruby ./bin/main.rb`
  - Then provide the following inputs
    ```bash
    PLACE 0,0,NORTH
    MOVE
    REPORT
    ```
  - then you should get an output
    ```bash
    Output: 0,1,NORTH
    ```

## NODE

This is the solution of the challenge in JS.

Follow the following steps:

- run `cd node`
- run `node manager.js`
  - Then provide the following inputs
    ```bash
    PLACE 0,0,NORTH
    MOVE
    REPORT
    ```
  - then you should get an output
    ```bash
    Output: 0,1,NORTH
    ```

## TEST DATA

```bash
PLACE 0,0,NORTH
LEFT
REPORT
```

```bash
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```

```bash
MOVE
MOVE
PLACE 1,2,WEST
RIGHT
MOVE
MOVE
LEFT
MOVE
REPORT
```

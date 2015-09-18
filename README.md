# Knight's Travails

#### TODO
-Fix up private/public methods

##Description:
A knight in chess can move to any square on the standard 8x8 chess board from any other square on the board, given enough turns. Its basic move is two steps forward and one step to the side. It can face any direction

This script provides a function that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.


##Example:

```ruby
starting_node = Node.new(3,3)
end_node = Node.new(4,3)

knight = Knight.new(starting_node, end_node)

>knight.print_path
  You made it in 3 moves!  Here's your path:
  [3,3]
  [4,5]
  [2,4]
  [4,3]
```


##Purpose:
The purpose of this exercise was to gain practice with core CS fundamentals, such as Data Structures & Algorithms

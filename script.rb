# frozen_string_literal: true

load 'board.rb'

def human_plays(board)
  board.print
  input = board.obtain_input
  puts "Player selects #{input}"
  board.squares[input - 1].value = 'O'
  p board.squares[7]
  board.print
end

def computer_plays(board)
  puts "The computer plays..."
  options = board.squares.select { |val| val.value.instance_of?(Integer) }
  options.map! { |val| val.value}
  choice = options[rand(options.length)]
  puts choice
  puts "The computer selects #{choice}"
  board.squares[choice - 1].value = 'X'
end
  
board = Board.new
puts 'Let\'s play a game of tic tac toe'
  
human_plays(board)
computer_plays(board)
board.print
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
  puts 'The computer plays...'
  options = board.squares.select { |val| val.value.instance_of?(Integer) }
  options.map!(&:value)
  choice = options[rand(options.length)]
  puts "The computer selects #{choice}"
  board.squares[choice - 1].value = 'X'
end

board = Board.new
puts 'Let\'s play a game of tic tac toe'

won = true

while board.squares_available? && won
  human_plays(board)
  if board.check_win?('O')
    puts 'Hooray, the Player has won'
    break
  end
  break unless board.squares_available?

  computer_plays(board)
  if board.check_win?('X')
    puts 'Hooray, the Computer has won'
    break
  end
end

puts board.squares_available?

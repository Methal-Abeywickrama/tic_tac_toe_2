# frozen_string_literal: true

load 'square.rb'

class Board
  attr_accessor :squares

  def initialize
    @squares = []
    for i in 1..9 do 
      @squares.push(Square.new(i))
    end
  end

  def print
    puts "#{@squares[0].value} || #{@squares[1].value} || #{@squares[2].value}"
    puts "#{@squares[3].value} || #{@squares[4].value} || #{@squares[5].value}"
    puts "#{@squares[6].value} || #{@squares[7].value} || #{@squares[8].value}"
  end

  def obtain_input
    puts 'Please enter the position of an available square'
    input = gets.chomp!.to_i
    until input.instance_of?(Integer)  && self.squares[input - 1].value == input
      puts 'Please enter the position of an available square'
      input = gets.chomp!.to_i
    end
    input
  end

  def check_win(mark)
    won = false
    case mark
    when (@squares[0] == @squares[1]) == @squares[2]
      won = true
    when (@squares[3] == @squares[4]) == @squares[5]
      won = true
    when (@squares[6] == @squares[7]) == @squares[8]
      won = true
    when (@squares[0] == @squares[3]) == @squares[6]
      won = true
    when (@squares[1] == @squares[4]) == @squares[5]
      won = true
    when (@squares[2] == @squares[5]) == @squares[8]
      won = true
    when (@squares[0] == @squares[4]) == @squares[8]
      won = true
    when (@squares[2] == @squares[4]) == @squares[6]
      won = true
    end
    won
  end

end
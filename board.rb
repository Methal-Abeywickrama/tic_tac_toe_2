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

  def squares_available?
    @squares.any? { |val| val.value.instance_of?(Integer)}

  end

  def check_win?(mark)

    won = false
    if [@squares[0].value, @squares[1].value, @squares[2].value].all? { |val| val == (@squares[0].value)}
      won = true
    elsif [@squares[3].value, @squares[4].value, @squares[5].value].all? { |val| val == (@squares[3].value)}
      won = true
    elsif [@squares[6].value, @squares[7].value, @squares[8].value].all? { |val| val == (@squares[6].value)}
      won = true
    elsif [@squares[0].value, @squares[3].value, @squares[6].value].all? { |val| val == (@squares[0].value)}
      won = true
    elsif [@squares[1].value, @squares[4].value, @squares[7].value].all? { |val| val == (@squares[1].value)}
      won = true
    elsif [@squares[2].value, @squares[5].value, @squares[8].value].all? { |val| val == (@squares[2].value)}
      won = true
    elsif [@squares[0].value, @squares[4].value, @squares[8].value].all? { |val| val == (@squares[0].value)}
      won = true
    elsif [@squares[2].value, @squares[4].value, @squares[6].value].all? { |val| val == (@squares[2].value)}
      won = true
    end
    won
  end

end
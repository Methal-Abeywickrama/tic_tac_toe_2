# frozen_string_literal: true

load 'square.rb'

class Board
  attr_accessor :s1, :s2, :s3, :s4, :s5, :s6, :s7, :s8, :s9

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
 
  # def get_input
    # puts "Please enter the position of an available square"
    # input = gets.chomp!
  # end
end
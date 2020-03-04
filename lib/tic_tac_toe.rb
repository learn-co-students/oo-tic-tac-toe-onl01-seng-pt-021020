require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def input_to_index(input)
input.to_i-1

end

def move(index, token="X")
@board[index] = token
end

def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true
  else
   return false
  end
end

def turn_count
  counter = 0
  @board.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
end
end
counter
end

#["O", " ", " ", " ", "X", " ", " ", " ", " "]
def current_player
  turn_count.even? ? "X": "O"
end

def turn
input = gets.chomp
puts input
index = input_to_index(input)
token = current_player
valid_move?(index)
if valid_move?(index)
  move(index, token)
  display_board
else
  turn
end
end


def won?

end

def full
end

end

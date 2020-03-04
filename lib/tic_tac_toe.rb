require 'pry'
class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(str)
    str = str.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] =="O" ? true : false
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index) ? true : false
  end

  def turn_count
    @board.count('X') + @board.count('O')
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "enter a number 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      puts "Invalid, choose a new number."
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |winner|
      if @board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X"
        winner
      elsif @board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O"
        winner
      else
        false
      end
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],
    [1,4,7],[2,5,8],[0,4,8],[2,4,6]
  ]

  def full?
    !@board.include?(" ") ? true : false
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    WIN_COMBINATIONS.find do |winner|
      if @board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X"
        return "X"
      elsif @board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O"
        return "O"
      else
        nil
      end
    end
  end

  def play
    while over? != true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end

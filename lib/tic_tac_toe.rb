require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end 
  
  def move(index, user_input)
    @board[index] = user_input
  end
  
  def position_taken?(index)
    if @board[index] != " "
      return true
    else
      return false
    end
  end
  
  def valid_move?(board_square)
    board_square.between?(0, 8) && !(self.position_taken?(board_square))
  end
  
  def turn_count
    @board.count('X') + @board.count('O')
  end
    
  def current_player  
    if self.turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end  
  
  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.chomp
    
    index = self.input_to_index(user_input)
    board_square = self.current_player
    
    if self.valid_move?(index)
      self.move(index, board_square)
      self.display_board
    else
      self.turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.any? do |array|
      if @board[array[0]] == @board[array[1]] && @board[array[1]] == @board[array[2]] && position_taken?(array[0])
        return array
      end
    end
  # binding.pry
  end
  
  def full?
    !(@board.include?(" "))
  end  
  
  def draw?
    !(self.won?) && self.full?
  end
    
  def over?
    self.draw? || self.won?
  end

  def winner
  #  binding.pry
    if self.won?
      @board[self.won?[0]]
    else
      nil
    end
  end
  
  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

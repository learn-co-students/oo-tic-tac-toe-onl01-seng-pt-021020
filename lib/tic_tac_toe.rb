
class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2], # Top row 
    [3,4,5], # Middle 
    [6,7,8], # Bottom row 
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal 1 
    [2,4,6], # Diagonal 2 
    ]
    
  def initialize()
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input = input.to_i 
    input -= 1
  end
  
  def move(index, token = X)
    @board[index] = token
  end

  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true 
    else
      false
    end
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn
    puts "Please enter 1-9: " #prompts user for input
    input = gets.chomp # recieves user input
    index = input_to_index(input) # turns user input to an integer - 1
    if valid_move?(index)
      token = current_player 
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  def won?
    x = WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == "X" &&
      @board[combo[1]] == "X" &&
      @board[combo[2]] == "X"
    end
    
    o = WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == "O" &&
      @board[combo[1]] == "O" &&
      @board[combo[2]] == "O"
    end
    
    return x || o
  end
  
  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end
  
  def draw?
    if full? && !(won?)
      true
    else
      false
    end
  end
  
  def over?
    won? || draw? || full?
  end
  
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play

    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
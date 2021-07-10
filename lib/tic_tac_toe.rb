class TicTacToe
  
  def initialize 
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input, token="X")
    @board[input] = token
  end

  def position_taken?(index)
        ((@board[index] == "X") || (@board[index] == "O"))
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count 
    turn_number = 0
    @board.each do |board_space|
      if board_space != " "
        turn_number += 1 
      end
    end
    turn_number
  end
  
  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end
  
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      # pos_2 = combo[1]
      # pos_3 = combo[2]
      
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo 
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo 
      else
        false 
      end 
    end
  end
  
  def full? 
    !@board.include?(" ")
  end

  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      @board[won?[0]]
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
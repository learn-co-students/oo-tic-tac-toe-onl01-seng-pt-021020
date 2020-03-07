class TicTacToe 
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]
    
  def initialize 
    @board = [" "," "," "," "," "," "," "," "," "] #Array.new(9, "")
  end 
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
   
   def input_to_index(str_input)
     str_input.to_i - 1
   end 
   
   def move(idx, char)
     @board[idx] = char
   end 
   
   def position_taken?(idx)
     #if @board[idx] == " "
       #return false 
     #else 
       #return true 
     #end 
     (@board[idx] == " ") ? false : true 
   end 
 
  def valid_move?(idx) 
    idx.between?(0, 8) && !(position_taken?(idx))
  end 
  
  def turn_count
    @board.count("X") + @board.count("O")
  end 
  
  def current_player
    (turn_count.even?) ? "X" : "O"
  end 
  
  def turn 
    input = gets.chomp #asks the user for input 
    puts input 
    index = input_to_index(input)
    token = current_player
    
    if valid_move?(index)
      move(index, token)
      display_board
    end 
  end

  
end 
 
       
   
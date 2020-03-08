require 'pry'
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
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(str_input)#change input to #index, sub 1

    str_input.to_i - 1 #input comes in as string. we need to turn the input into an Integer
  end

  def move(idx, char)
    @board[idx]= char
  end

  def position_taken?(idx)
    (@board[idx] == " ") ? false : true
  end

  def valid_move?(idx)
    idx.between?(0, 8) && !(self.position_taken?(idx))
  end

  def turn_count #counting characters in #board
    @board.count("X") + @board.count("O")
  end

  def current_player
    (self.turn_count.even?) ? "X" : "O"
  end

  def turn
    input= gets.chomp #ask user for input, #where they want to move on board nums1-9

    puts input

    index = self.input_to_index(input)#string to int
    token = self.current_player

    if self.valid_move?(index) #validateinput
      self.move(index, token) #makes valid move
      self.display_board
    else
      self.turn
    end
  end

  def won?(board) #check board and see if there are any winning sets
     WIN_COMBINATIONS.each do |win_combo|
       index_1= win_combo[0]
       index_2= win_combo[1]
       index_3= win_combo[2]

       position_1= board[index_1]
       position_2= board[index_2]
       position_3= board[index_3]

     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       win_combo
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       win_combo
     end
   end
   false
  end

  def full?
    @board.all?{|index| index == "X" || index == "O"}
  end

  def won?
    #using position taken to check for empty spaces
    win_combo=nil
    WIN_COMBINATIONS.each do |arr|
      if @board[arr[0]] == @board[arr[1]] && @board[arr[1]] == @board[arr[2]] && position_taken?(arr[0])
        win_combo = arr
      end
    end
    win_combo
  end

  def draw?
    #if no winning combos and board is full
    !self.won? && self.full?
  end

  def over?
    self.draw? || self.won?
  end

  def winner #how do we get a character?(in @board)
    if self.won?
      @board[self.won?[0]]
    else
      nil
    end
  end

end

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
    idx.between?(0, 8) && !(self.position_taken?(idx))
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    (turn_count.even?) ? 'X' : 'O'
  end

  def turn
    input = gets.chomp #asks the user for input, where they want to stay on the board

    puts input

    index = self.input_to_index(input)
    token = self.current_player

    if self.valid_move?(index) #validate user input
      self.move(index, token) #make valid moves
      self.display_board
    else
      self.turn
    end
  end

  def full?
    !(@board.include?(' '))
  end

  def won?
    win_combo = nil
    WIN_COMBINATIONS.each do |arr|
      if @board[arr[0]] == @board[arr[1]] && @board[arr[1]]== @board[arr[2]] && position_taken?(arr[0])
        win_combo = arr
      end
    end
    win_combo
  end

  def draw?
    !(self.won?) && self.full?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    if self.won?
      @board[self.won?[0]]
    else
      nil
    end
  end

  def play
      turn until over?
       if self.won?
      puts "Congratulations #{winner}!"
       else self.draw?
      puts "Cat's Game!"
    end
  end
end

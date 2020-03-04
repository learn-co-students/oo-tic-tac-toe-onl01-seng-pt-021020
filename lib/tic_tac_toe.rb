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
    @board = [" "," "," "," "," "," "," "," "," "] #Array.new(9, '')
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(str_input)
    #change input to index, subtract 1
    str_input.to_i - 1
  end

  def move(idx, char)
    @board[idx] = char
  end

  def position_taken?(idx)
    if @board[idx] == " "
        return false
    else
        return true
    end

    (@board[idx] == " ") ? false : true
  end

  def valid_move?(idx)
  idx.between?(0, 8) && !(self.position_taken?(idx))
    #!(position_taken?(idx)) this works too
  end

  def turn_count
    @board.count('X') + @board.count('O')
  end

  def current_player
    (self.turn_count.even?) ? 'X' : 'O'
  end

  def turn
    input = gets.chomp


    index = self.input_to_index(input)
    token = self.current_player
    if  self.valid_move?(index)
      self.move(index, token)
      self.display_board
    else
      self.turn
#ask for input, where they want to move onthe board, nums 1-9
    end
  end

  def won?
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

  def full?
    @board.all?{|index| index == "X" || index == "O"}
  end

  def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if won? || draw?
    return true
  else
    return false
  end
end

def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end

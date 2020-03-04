class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [6,4,2]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ------------ "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ------------ "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    # !(@board[index].nil? || @board[index] == " ") also works
    (@board[index] == " ") ? false : true
  end

  def valid_move?(index)
    index.between?(0, 8) && !(self.position_taken?(index))
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
   (self.turn_count.even?) ? "X" : "O"
  end

  def turn
    input = gets.chomp

    index = self.input_to_index(input)
    token = self.current_player

    if self.valid_move?(index)
        self.move(index, token)
        self.display_board
    else
      self.turn
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
  false
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    !self.won? && self.full?
  end

  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end

  def winner
    index = self.won?
    if index == false
      nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    until self.over? == true
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end

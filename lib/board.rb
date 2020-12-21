# frozen_string_literal: true
# main board class, includes both move functionality and win/draw tests
class Board

  attr_reader :board

  def initialize(rows = 6, columns = 7)
    @board = make_board(rows, columns)
  end

  def win?(player, board = @board)
    win_diagnol?(board, player) || win_horizontal?(board, player) || win_vertical?(board, player)
  end

  def play_piece(column, player)
    @board.reverse.each do |row|
      if row[column] == 'O'
        row[column] = player
        break
      end
    end
  end

  def draw?(player_one, player_two, board = @board)
    !win?(player_one) && !win?(player_two) && !board[0].include?('O')
  end

  def valid_move?(column, board = @board)
    column < 7 && board[0][column] == 'O' && column >= 0
  end

  private

  attr_writer :board

  def make_board(rows, columns)
    Array.new(rows) { Array.new(columns, 'O') }
  end

  def win_vertical?(board, player)
    (0..6).each do |column_index|
      streak = 0
      (0..5).each do |row_index|
        board[row_index][column_index] == player ? streak += 1 : streak = 0
        return true if streak >= 4
      end
    end
    false
  end

  def win_horizontal?(board, player)
    board.each do |row|
      streak = 0
      row.each do |slot|
        slot == player ? streak += 1 : streak = 0
        return true if streak >= 4
      end
    end
    false
  end

  def win_diagnol?(board, player)
    win_diagnol_right?(board, player) || win_diagnol_left?(board, player)
  end

  def win_diagnol_right?(board, player)
    (0..2).each do |row|
      (0..3).each do |column|
        return true if r_diagnol_check(row, column, board, player)
      end
    end
    false
  end

  def r_diagnol_check(row, column, board, player)
    array = []
    streak = 0
    until row > 5 || column > 6
      array.push(board[row][column])
      row += 1
      column += 1
    end
    array.each do |slot|
      slot == player ? streak += 1 : streak = 0
      return true if streak >= 4
    end
    false
  end

  def win_diagnol_left?(board, player)
    (0..2).each do |row|
      (6).downto(3) do |column|
        return true if l_diagnol_check(row, column, board, player)
      end
    end
    false
  end

  def l_diagnol_check(row, column, board, player)
    array = []
    streak = 0
    until row == 5 || column == 0 
      array.push(board[row][column])
      row += 1
      column -= 1
    end
    array.each do |slot|
      slot == player ? streak += 1 : streak = 0
      return true if streak >= 4
    end
    false
  end
 
end
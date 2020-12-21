# frozen_string_literal: true
require_relative './board'
require_relative './display'
# main game class

class Game 

  include Display

  attr_reader :board, :player_one, :player_two

  PONE_CHARACTER = 'X'
  PTWO_CHARACTER = 'Y'

  def initialize()
    @board = Board.new()
    @player_one = PONE_CHARACTER
    @player_two = PTWO_CHARACTER
  end

  def turn(player, board = @board)
    print_board(board.board)
    column = prompt_player(player)
    board.play_piece(column, player)
  end

  def prompt_player(player)
    puts "It's #{player}'s turn. Please enter the number of the column where you would like to drop your piece."
    input = gets.chomp.to_i - 1
    until @board.valid_move?(input)
      puts "Invalid move. Please put the number of the column where you would like to drop your piece."
      input = gets.chomp.to_i - 1
    end
    input
  end

  def game_over(player_one = @player_one, player_two = @player_two)
    if board.win?(player_one)
      puts "Congrats to #{player_one}, you are a champion!"
    elsif board.win?(player_two)
      puts "Congrats to #{player_one}, you are a champion!"
    elsif board.draw?(player_one, player_two)
      puts "It's a draw, try again nerds!"
    end
  end

  def play(board = @board, player_one = @player_one, player_two = @player_two)
    print_board(@board.board)
    instructions
    until board.win?(player_one) || board.win?(player_two) || board.draw?(player_one, @player_two)
      turn(player_one)
      turn(player_two)
    end
    game_over
  end

end

game = Game.new()
game.play
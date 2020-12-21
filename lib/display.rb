# frozen_string_literal: true

# display module for connect four
module Display
  def instructions
    puts 'Hello and welcome to...'
    sleep(0.5)
    puts "
    _______  _______  __    _  __    _  _______  _______  _______    _   ___ 
    |       ||       ||  |  | ||  |  | ||       ||       ||       |  | | |   |
    |       ||   _   ||   |_| ||   |_| ||    ___||       ||_     _|  | |_|   |
    |       ||  | |  ||       ||       ||   |___ |       |  |   |    |       |
    |      _||  |_|  ||  _    ||  _    ||    ___||      _|  |   |    |___    |
    |     |_ |       || | |   || | |   ||   |___ |     |_   |   |        |   |
    |_______||_______||_|  |__||_|  |__||_______||_______|  |___|        |___|


    "
    sleep(0.5)
    puts "Instructions:
    Each player will take a turn to drop one of their pieces into a column. 
    The first player to have four-in-a-row diagonally, vertically, or horizontally is the winner!
    Red goes first. Good luck!"
  end

  def print_board(board)
    board.each do |row|
      print row
      puts ""
    end
  end
end

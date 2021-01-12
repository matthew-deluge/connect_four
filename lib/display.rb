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
    puts "press any key to continue."
    gets.chomp
  end

  def print_board(board)
    (1..7).each { |column| print "  #{column} "}
    puts ""
    board.each do |row|
      print "| "
      row.each { |slot| print "#{slot} | "}
      puts ""
      (0..28).each {print "-"}
      puts ""
    end
  end
end

# allows for colored strings: https://stackoverflow.com/questions/1489183/colorized-ruby-output-to-the-terminal
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end

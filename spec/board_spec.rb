# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  
  describe '#win?' do
    context 'when passed horizontal winning board' do
    subject(:win_board) { described_class.new() }
      it 'returns true' do
        horizontal_win = [['O','O','O','O','O','O','O'],
                          ['O','O','O','O','O','O','O'],
                          ['O','O','O','O','O','O','O'],
                          ['O','O','O','O','O','O','O'],
                          ['O','O','O','O','O','O','O'],
                          ['X','X','X','X','O','O','O']]
        expect(win_board.win?('X', horizontal_win)).to be true
      end
    end

    context 'when passed a vertical winning board' do
      subject(:win_board) { described_class.new() }
      it 'returns true' do
        vertical_win = [['O','O','O','O','O','O','O'],
                        ['O','O','O','O','O','O','O'],
                        ['X','O','O','O','O','O','O'],
                        ['X','O','O','O','O','O','O'],
                        ['X','O','O','O','O','O','O'],
                        ['X','O','O','O','O','O','O']]
        expect(win_board.win?('X', vertical_win)).to be true
       end
    end

    context 'when passed a left diagnol winning board' do
      subject(:win_board) { described_class.new() }
       it 'returns true' do
        diagnol_win = [['X','O','O','O','O','O','O'],
                       ['O','O','O','O','O','O','O'],
                       ['O','X','O','X','O','O','O'],
                       ['X','O','X','O','O','O','O'],
                       ['X','O','O','X','O','O','O'],
                       ['X','O','O','O','X','O','O']]
        expect(win_board.win?('X', diagnol_win)).to be true
       end
    end

    context 'when passed a right diagnol winning board' do
      subject(:win_board) { described_class.new() }
       it 'returns true' do
        diagnol_win = [['O','O','O','O','O','O','O'],
                       ['O','O','O','O','O','O','O'],
                       ['O','O','O','O','X','O','O'],
                       ['O','O','O','X','O','O','O'],
                       ['O','O','X','O','O','O','O'],
                       ['O','X','O','O','O','O','O']]
        expect(win_board.win?('X', diagnol_win)).to be true
       end
    end

    context 'when passed a three diagnol streak' do
      subject(:win_board) { described_class.new() }
       it 'returns false' do
        diagnol_win = [['O','O','O','O','O','O','O'],
                       ['O','O','O','O','O','O','O'],
                       ['O','O','O','O','O','O','O'],
                       ['O','O','X','X','O','O','O'],
                       ['X','X','X','O','O','O','O'],
                       ['X','O','O','O','O','O','O']]
        expect(win_board.win?('X', diagnol_win)).to be false
       end
    end 
    
    context 'when passed a non-winning board' do
      subject(:no_win_board) { described_class.new() }
       it 'returns false' do
        no_win = [['O','O','O','O','O','O','O'],
                        ['O','O','O','O','O','O','O'],
                        ['O','O','O','O','O','O','O'],
                        ['O','O','O','X','O','O','O'],
                        ['O','O','O','X','O','O','O'],
                        ['X','O','O','X','O','O','X']]
         expect(no_win_board.win?('X', no_win)).to be false
       end
    end
  end

  describe "#valid_move" do

    context 'When a column is open' do
      subject(:open_board) {described_class.new()}
      it 'returns true' do
        value = open_board.valid_move?(1)
        expect(value).to be true
      end
    end

    context 'When a column is full' do
      subject(:closed_board) {described_class.new()}
      it 'returns false' do
        full_column_board = [['X','O','O','O','O','X','X'],
                             ['X','O','O','O','X','X','O'],
                             ['X','O','O','X','X','O','O'],
                             ['X','O','X','X','O','O','O'],
                             ['X','X','O','O','O','O','O'],
                             ['X','O','O','O','O','O','O']]
        value = closed_board.valid_move?(0, full_column_board)
        expect(value).to be false
      end
    end
  end

  describe '#play_piece' do
    context 'When passed a piece' do
      it 'drops it to the lowest part of that column' do
        board = Board.new()
        board.play_piece(0, "W")
        expect(board.board[5][0]).to eq('W')
      end

      it 'does not impact the rest of the board' do
        board = Board.new()
        board.play_piece(0, 'W')
        expect(board.board[0][0]).not_to eq('W')
      end
    end

    context 'When passed a piece to a full row' do
      it 'does nothing' do
        board = Board.new()
        test_board = [['Y','O','O','O','O','O','O'],
                      ['Y','O','O','O','O','O','O'],
                      ['Y','O','O','O','O','O','O'],
                      ['X','O','O','O','O','O','O'],
                      ['X','O','O','O','O','O','O'],
                      ['X','O','O','O','O','O','O']]
        board.board = test_board
        board.play_piece(1, 'X')
        expect(board.board).to eq(test_board)
      end
    end
  end

  describe '#draw?' do
    context 'when passed a full board with no win' do
      it 'returns true' do
        board = described_class.new()
        draw_board = [['Y','X','Y','X','Y','X','Y'],
                      ['Y','X','Y','X','Y','X','Y'],
                      ['Y','X','Y','X','Y','X','Y'],
                      ['X','Y','X','Y','X','Y','X'],
                      ['X','Y','X','Y','X','Y','X'],
                      ['X','Y','X','Y','X','Y','X']]
        result = board.draw?('X','Y',draw_board)
        expect(result).to be true
      end
    end
  end
end
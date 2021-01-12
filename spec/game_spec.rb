# frozen_string_literal: true
require_relative '../lib/game'

describe Game do

  describe '#turn' do
    context 'when passed a move' do
      subject(:turn_game) { described_class.new() }
      before do
        allow(turn_game).to receive(:prompt_player).and_return(0)
      end

      it 'updates the board' do
        board = [ ['O','O','O','O','O','O','O'],
                  ['O','O','O','O','O','O','O'],
                  ['O','O','O','O','O','O','O'],
                  ['O','O','O','O','O','O','O'],
                  ['O','O','O','O','O','O','O'],
                  ['X','O','O','O','O','O','O']]
        turn_game.turn('X')
        expect(turn_game.board.board).to eq(board)
      end
    end
  end

  describe '#prompt_player' do
    subject(:prompt_game) { described_class.new() }
    context "when passed a valid move" do
      before do
        allow(prompt_game).to receive(:gets).and_return('1')
      end
      it "returns an integer of less than one of that move" do
        result = prompt_game.prompt_player('X')
        expect(result).to eq(0)
      end
    end

    context 'when passed a value above 7' do
      before do
        allow(prompt_game).to receive(:gets).and_return('8','1')
      end

      it "re-prompts the player" do
        expect(prompt_game).to receive(:puts).twice
        prompt_game.prompt_player('X')
      end
    end
  end

  describe '#play' do
    subject(:play_game) { described_class.new() }
    context 'when a move ends the game' do
      before do
        allow(play_game).to receive(:gets).and_return('1','2','1','2','1','2','1')
      end
      it 'calls #game_over' do
        expect(play_game).to receive(:game_over)
        play_game.play
      end
    end
  end
end
        




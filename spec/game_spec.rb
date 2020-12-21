# frozen_string_literal: true
require_relative '../lib/game'

describe Game do

  describe '#turn' do 
    subject(:turn_game) { described_class.new() }
    context 'when passed a valid move' do
      it 'updates board' do
        allow(turn_game).to receive(:gets).and_return('1')
        turn_game.turn('X')
        result = turn_game.board.board[5][0]
        expect(result).to eq('X')
      end
    end
  end

  describe '#prompt_player' do
    subject(:prompt_game) { described_class.new() }
    context 'when passed an invalid move' do
      it 'returns an error message' do
        allow(prompt_game).to receive(:gets).and_return('10', '1')
        expect(prompt_game).to receive(:puts).exactly(2).times
        prompt_game.prompt_player('X')
      end
    end
  end
end

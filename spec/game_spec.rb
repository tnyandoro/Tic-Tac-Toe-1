# game.rb
require '../lib/game'
require '../lib/board'
require '../lib/player'


describe 'Game' do
  let(:player1)  { Player.new('sinan') }
  let(:player2) { Player.new('tendai') }
  let(:test_game) { Game.new(player1, player2)}
  describe 'Game#initialize' do
    it 'Initialize Game object' do
      expect(player1.name).to eql('sinan')
      expect(player2.name).to eql('tendai')
      expect(player1.type).to eql('_')
      expect(player2.type).to eql('_')
    end
  end
  describe 'Game#clean_position' do
    let(:user_input) { 'B2' }
    it 'Strips user input' do
      expect(test_game.clean_position(user_input)).to eql([1, 1])
    end
  end
  describe 'Game#check_outcome' do
    it 'It checks moves outcome' do
      expect(test_game.check_outcome(player1)).to eql(-1)
    end
  end
end

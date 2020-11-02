# player.rb

require '../lib/player'

describe Player do
  let(:player) { Player.new('William') }
  describe 'Player#init' do
    it 'initialize the player' do
      expect(player.name).to eql('William')
      expect(player.type).to eql('_')
    end
  end
end
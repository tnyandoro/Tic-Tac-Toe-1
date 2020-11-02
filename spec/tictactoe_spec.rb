require '../lib/game'
require '../lib/board'
require '../lib/player'
# player.rb
describe Player do
  let(:player) { Player.new('William') }
  describe 'Player#init' do
    it 'initialize the player' do
      expect(player.name).to eql('William')
      expect(player.type).to eql('_')
    end
  end
end

# board.rb
describe Board do
  let(:board) { Board.new }
  let(:value) { 'X' }
  let(:pos) { [0, 1] }
  describe 'Board#update' do
    it 'Updates the board' do
      board.update(value, pos)
      board_test = board.board.flatten
      expect(board_test).to eql(%w[_ X _ _ _ _ _ _ _])
    end
  end
  describe 'Board#legal_input' do
    let(:user_input) { 'A1' }
    it 'Check users input is legal' do
      expect(board.legal_input?('A1')).to eql(true)
    end
  end
  describe 'Board#cell_empty?' do
    it 'Check if the cell that user wants to modify is empty #Cell Empty' do
      expect(board.cell_empty?([0, 0])).to eql(true)
    end
  end
  describe 'Board#cell_empty?' do
    it 'Check if the cell that user wants to modify is empty #Cell Marked ' do
      board.update(value, pos)
      expect(board.cell_empty?([0, 1])).to eql(false)
    end
  end
  describe 'Board#status' do
    it 'Check if user won the game vertical' do
      board.update(value, [0, 0])
      board.update(value, [0, 1])
      board.update(value, [0, 2])
      expect(board.status).to eql(1)
    end
  end
  describe 'Board#status' do
    it 'Check if user won the game horizontal' do
      board.update(value, [0, 0])
      board.update(value, [1, 0])
      board.update(value, [2, 0])
      expect(board.status).to eql(1)
    end
  end
  describe 'Board#status' do
    it 'Check if user won the game diagonal' do
      board.update(value, [0, 0])
      board.update(value, [1, 1])
      board.update(value, [2, 2])
      expect(board.status).to eql(1)
    end
  end
  describe 'Board#status' do
    it 'Check if game is tie' do
      board.update('X', [0, 0])
      board.update('X', [1, 0])
      board.update('O', [2, 0])
      board.update('O', [0, 1])
      board.update('O', [1, 1])
      board.update('X', [2, 1])
      board.update('X', [0, 2])
      board.update('X', [1, 2])
      board.update('O', [2, 2])
      expect(board.status).to eql(0)
    end
  end
end
# game.rb
describe 'Game' do
  let(:player1) { Player.new('sinan') }
  let(:player2) { Player.new('tendai') }
  let(:test_game) { Game.new(player1, player2) }
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

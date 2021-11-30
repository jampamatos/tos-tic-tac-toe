require_relative 'game_manager.rb'
require_relative 'board.rb'

game_manager = GameManager.new
board = Board.new

game_manager.player_name(1)
p1_n = game_manager.player1_name.delete("\n")
game_manager.player_symbol(1)
p1_s = game_manager.player1_symbol.delete("\n")

game_manager.player_name(2)
p2_n = game_manager.player2_name.delete("\n")
game_manager.player_symbol(2)
p2_s = game_manager.player2_symbol.delete("\n")

system 'clear'

board.render
board.make_play(p1_n, 1, p1_s)
board.render
board.make_play(p2_n, 1, p2_s)
#board.render
#board.make_play('1', 3, 'X')
#board.render

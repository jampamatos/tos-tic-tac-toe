require_relative 'game_manager'
require_relative 'board'

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

board.game_start
board.render

loop do
  puts "#{p1_n}, please select a number:"
  n1 = gets.delete("\n").to_i
  board.make_play(p1_n, n1, p1_s, 1)
  board.render
  break if board.game_over == true

  puts "#{p2_n}, please select a number:"
  n2 = gets.delete("\n").to_i
  board.make_play(p2_n, n2, p2_s, 2)
  board.render
  break if board.game_over == true
end

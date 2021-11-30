require_relative 'board.rb'

board = Board.new
board.render

board.make_play('1', 1, 'X')
board.render
board.make_play('1', 4, 'X')
board.render
board.make_play('1', 7, 'X')
board.render
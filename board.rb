class Board
  attr_accessor :cell, :game_over

  @@VICTORY = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  @@PLAYER1 = []
  @@PLAYER2 = []

  def initialize
    @cell = (1..9).to_a
    @game_over = false
  end

  def render
  puts "
   #{cell[0]} | #{cell[1]} | #{cell[2]}
  ---+--+---
   #{cell[3]} | #{cell[4]} | #{cell[5]}
  ---+---+---
   #{cell[6]} | #{cell[7]} | #{cell[8]} "
  end

  def print_play(n, symbol)
    cell[n-1] = symbol
  end

  def make_play(player, n, symbol)
    puts "Player #{player} chose number #{n}."
    print_play(n, symbol)
    @@PLAYER1 << n-1
    p @@PLAYER1

  end

  def game_over?
  end

end
class Board
  attr_accessor :cell, :game_over, :player1, :player2, :selected

  @@VICTORY = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  def initialize
    @cell = (1..9).to_a
    @game_over = false
    @player1 = []
    @player2 = []
    @selected = []
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
    if selected.include?(n)
      puts "This number was already selected. Please chose another one."
    else
      puts "#{player} chose number #{n}."
      print_play(n, symbol)
      player1 << n - 1
      selected << n
    end
    @@VICTORY.each do |combo|
      self.game_over = true if combo == player1
    end
  end
end

class Board
  attr_accessor :cell, :game_over, :player1, :player2

  @@VICTORY = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
 
  def initialize
    @cell = (1..9).to_a
    @game_over = false
    @player1 = []
    @player2 = []
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
    puts "#{player} chose number #{n}."
    print_play(n, symbol)
    self.player1 << n-1
    @@VICTORY.each do |combo|
      if combo == self.player1
        self.game_over = true
      end
    end 
  end

end
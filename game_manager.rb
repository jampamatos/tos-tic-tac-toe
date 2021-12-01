class GameManager
  attr_accessor :player1_name, :player1_symbol, :player1_score, :player2_name, :player2_symbol, :player2_score, :board

  def initialize
    @player1_name = ''
    @player1_symbol = ''
    @player1_score = 0
    @player2_name = ''
    @player2_symbol = ''
    @player2_score = 0
    @board = Board.new
  end

  def render
    board.render
  end

  def game_start
    board.game_start
  end

  def make_play(p, n, s, a)
    board.make_play(p, n, s, a)
  end

  def player_name(n)
    puts "Player #{n}, please type in your name:"
    instance_variable_set("@player#{n}_name", gets)
    if !(instance_variable_get("@player#{n}_name").length > 2)
      puts 'Your name must be at least 2 characters long.'
      player_name(n)
    end
  end

  def player_symbol(n)
    name = instance_variable_get("@player#{n}_name")
    puts "Hello #{name.delete("\n")}, please type a character for your symbol:"
    instance_variable_set("@player#{n}_symbol", gets.upcase)
    if !(instance_variable_get("@player#{n}_symbol").length == 2)
      puts 'Your symbol must be 1 character long.'
      player_symbol(n)
    end
  end
end

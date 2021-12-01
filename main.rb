require_relative 'game_manager'
require_relative 'board'

game_manager = GameManager.new

def show_score(p1, p2, game_manager)
  puts "{#{p1}: #{game_manager.player1_score} points, #{p2}: #{game_manager.player2_score} points}"
end

game_manager.player_name(1)
p1_n = game_manager.player1_name.delete("\n")
game_manager.player_symbol(1)
p1_s = game_manager.player1_symbol.delete("\n")

game_manager.player_name(2)
p2_n = game_manager.player2_name.delete("\n")
game_manager.player_symbol(2)
p2_s = game_manager.player2_symbol.delete("\n")


system 'clear'

def start(game_manager, p1_n, p1_s, p2_n, p2_s)
  game_manager.game_start
  show_score(p1_n, p2_n, game_manager)
  game_manager.render

  loop do
    puts "#{p1_n}, please select a number:"
    n1 = gets.delete("\n").to_i
    game_manager.make_play(p1_n, n1, p1_s, 1)
    show_score(p1_n, p2_n, game_manager)
    game_manager.render
    if game_manager.board.game_over == true
      game_manager.update_points(1)
      puts "YOU WIN, #{p1_n.upcase}! You now have #{game_manager.player1_score} points!"
      restart(game_manager, p1_n, p1_s, p2_n, p2_s)
      break
    end
    if game_manager.board.selected.length >= 9
      draw(game_manager, p1_n, p1_s, p2_n, p2_s)
      break
    end

    puts "#{p2_n}, please select a number:"
    n2 = gets.delete("\n").to_i
    game_manager.make_play(p2_n, n2, p2_s, 2)
    show_score(p1_n, p2_n, game_manager)
    game_manager.render
    if game_manager.board.game_over == true
      game_manager.update_points(2)
      puts "YOU WIN, #{p2_n.upcase}! You now have #{game_manager.player2_score} points!"
      restart(game_manager, p1_n, p1_s, p2_n, p2_s)
      break 
    end
  end
end

def restart(game_manager, p1_n, p1_s, p2_n, p2_s)
  puts "Do you want to start again? (Y/N)"
  ans = gets.delete("\n").upcase
  if ans == 'Y'
    system 'clear'
    start(game_manager, p1_n, p1_s, p2_n, p2_s)
  elsif ans == 'N'
    puts "Thanks for playing!"
  else
    puts "Please select 'Y' or 'N'"
    restart(game_manager, p1_n, p1_s, p2_n, p2_s)
  end
end

def draw(game_manager, p1_n, p1_s, p2_n, p2_s)
  puts "It's a draw!"
  puts "#{p1_n} have #{game_manager.player1_score} points and #{p2_n} have #{game_manager.player2_score} points"
  restart(game_manager, p1_n, p1_s, p2_n, p2_s)
end

start(game_manager, p1_n, p1_s, p2_n, p2_s)



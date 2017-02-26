class Game
  require_relative 'board'
  require_relative 'player'

  def initialize(player1 = "player1", player2 = "player2")
    @player1 = Player.new(player1, "x")
    @player2 = Player.new(player2, "o")
    @board = Board.new
    @current_player = @player2
    play
  end


  def play
    until @board.game_over? || @board.board_full?
      @board.show_board
      @current_player = @current_player == @player1 ? @player2 : @player1
      make_move(@current_player)
    end

    end_game
  end

  def make_move(current_player)
    puts current_player.name + " it's your turn"
    while true
      move = gets.chomp().upcase
      column = move[0].ord - 65
      row = move[1].to_i - 1
      if @board.legal_move?(row, column) then break end
      puts "Illegal move. Try again."
    end
    
    @board.place(row, column, current_player.symbol)  
  end

  def end_game
    if @board.board_full?
      puts "it's a draw!"
      @player1.tie
      @player2.tie
    else
      puts @current_player.name + " has won the game!"
      if @current_player == @player1
        @player1.win
        @player2.lose
      else
        @player2.win
        @player1.lose
      end
    end
    @board.show_board
    puts "#{@player1.name} has #{@player1.wins} wins, #{@player1.losses} losses and #{@player1.ties} ties."
    puts "#{@player2.name} has #{@player2.wins} wins, #{@player2.losses} losses and #{@player2.ties} ties."
    puts "let's play again!"
    Game.new
  end

end

Game.new



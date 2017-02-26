class Player
  attr_accessor :name
  attr_reader :symbol, :wins, :losses, :ties

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @wins = 0
    @losses = 0
    @ties = 0
  end

  def win
    @wins += 1
  end

  def lose
    @losses += 1
  end

  def tie
    @ties += 1
  end

end
class Board
  def initialize
    @board = [[' ',' ',' '],[' ',' ',' '],[' ',' ',' ']]
  end

  def show_board
    horizonal_line = "  " + "-" * 13
    
    puts "    a   b   c  "
    puts horizonal_line
    
    @board.each_with_index do |row, i|
      puts (i + 1).to_s + " | " + row.join(" | ") + " |"
      puts horizonal_line
    end
  end

  def game_over?
    (column_win? || row_win? || diagonal_win? || board_full?) ? true : false
  end

  def legal_move?(row, column)
    row >= 0 && \
    column >= 0 && \
    (row - 1) < @board.length && \
    (column - 1) < @board[row].length && \
    @board[row][column] == ' ' \
    ? true : false
  end

  def place(row, column, symbol)
    @board[row][column] = symbol
  end

  def board_full?
    done = true
    @board.each do|row|
      row.any? { |cell| cell == ' '} ? done = false : next
    end
    done
  end

  def column_win?
    done = false
    @board.transpose.each do |row|
      row.all? { |cell| cell != ' ' && row[0] == cell} ? done = true : next
    end
    done
  end

  def row_win?
    done = false
    @board.each do |row|
      row.all? { |cell| cell != ' ' && row[0] == cell} ? done = true : next
    end
    done
  end

  def diagonal_win?
    [@board[1][1], @board[2][2], @board[0][0]].all? { |cell| cell == ('x' || 'o') } || \
    [@board[1][1], @board[0][2], @board[2][0]].all? { |cell| cell == ('x' || 'o') } \
    ? true : false
  end


end


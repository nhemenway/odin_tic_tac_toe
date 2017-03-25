require "board"
require "game"
require "player"

describe Board do #nothing working yet
  describe "#game_over?" do
    context "when a row win is complete" do
      let(:board) { [['x','x','x'],[' ',' ',' '],[' ',' ',' ']] }
      it "is true" do
        expect(game_over?).to eql(true)
      end
    end
  end
end
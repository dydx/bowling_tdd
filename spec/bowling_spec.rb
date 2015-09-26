require_relative '../lib/bowling'

describe Bowling do

  before(:each) do
    @game = Bowling.new
  end

  describe ".new" do
    it "should be able to be initialized" do
      expect(Bowling).to receive(:new)
      Bowling.new
    end
  end

  describe ".roll" do
    it "should be able to roll a ball" do
      expect(@game).to receive(:roll).with(0)
      @game.roll(0)
    end

    it "a gutter game should have a score of zero" do
      10.times do
        @game.roll(0)
      end
      expect(@game.score).to eql(0)
      @game.score
    end
  end
end

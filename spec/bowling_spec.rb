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

    it "has a zero score after rolling all gutterballs" do
      20.times do
        @game.roll(0)
      end
      expect(@game.score).to eql(0)
      @game.score
    end

    it "has a score of 20 after rolling all ones" do
      20.times do
        @game.roll(1)
      end
      expect(@game.score).to eql(20)
      @game.score
    end
  end
end

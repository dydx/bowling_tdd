require_relative '../lib/bowling'

describe Bowling do

  def roll_many(n, pins)
    n.times do
      @game.roll(pins)
    end
  end

  def roll_spare
    roll_many(2, 5)
  end

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
  end

  describe ".score" do
    it "has a zero score after rolling all gutterballs" do
      roll_many(20, 0)
      expect(@game.score).to eql(0)
      @game.score
    end

    it "has a score of 20 after rolling all ones" do
      roll_many(20, 1)
      expect(@game.score).to eql(20)
      @game.score
    end

  end

  describe "one spare" do

    it "calculates the score with one spare" do
      roll_spare
      @game.roll(3)
      roll_many(17, 0)
      expect(@game.score).to eql(16)
    end
  end

  describe "one strike" do

    it "calculates the score with one strike" do
      @game.roll(10)
      @game.roll(3)
      @game.roll(4)
      roll_many(16, 0)
      expect(@game.score).to eql(24)
    end

  end
end

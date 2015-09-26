class Bowling

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    score = 0
    rollCount = 0
    (0...10).each do
      if is_strike?(rollCount)
        score += 10 + next_two_balls_for_strike(rollCount)
        rollCount += 1
      elsif is_spare?(rollCount)
        score += 10 + next_ball_for_spare(rollCount)
        rollCount += 2
      else
        score += two_balls_in_frame(rollCount)
        rollCount += 2
      end
    end
    score
  end

private

  def two_balls_in_frame(rollCount)
    @rolls[rollCount] + @rolls[rollCount + 1]
  end

  def is_spare?(rollCount)
    (@rolls[rollCount] + @rolls[rollCount + 1] == 10)
  end

  def next_ball_for_spare(rollCount)
    @rolls[rollCount + 2]
  end

  def is_strike?(rollCount)
    @rolls[rollCount] == 10
  end

  def next_two_balls_for_strike(rollCount)
    @rolls[rollCount + 1] + @rolls[rollCount + 2]
  end
end

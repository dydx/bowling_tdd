class Bowling

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def is_spare?(rollCount)
    (@rolls[rollCount] + @rolls[rollCount + 1] == 10)
  end

  def score
    score = 0
    rollCount = 0
    (0...10).each do
      if (@rolls[rollCount] == 10)
        score += (10 + @rolls[rollCount + 1] + @rolls[rollCount + 2])
        rollCount += 1
      elsif is_spare?(rollCount)
        score += (10 + @rolls[rollCount + 2])
        rollCount += 2
      else
        score += (@rolls[rollCount] + @rolls[rollCount + 1])
        rollCount += 2
      end
    end
    score
  end
end

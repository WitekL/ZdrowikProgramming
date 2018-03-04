class Streak < ApplicationRecord

  def self.longest_negative
    self.all.where(positive: false).order("duration DESC").first
  end

  def self.longest_positive
    self.all.where(positive: true).order("duration DESC").first
  end
end

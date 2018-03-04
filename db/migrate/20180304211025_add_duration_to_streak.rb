class AddDurationToStreak < ActiveRecord::Migration[5.1]
  def change
    add_column :streaks, :duration, :integer
  end
end

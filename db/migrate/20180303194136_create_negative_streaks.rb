class CreateNegativeStreaks < ActiveRecord::Migration[5.1]
  def change
    create_table :negative_streaks do |t|
      t.datetime :beginning

      t.timestamps
    end
  end
end

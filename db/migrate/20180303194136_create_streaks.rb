class CreateStreaks < ActiveRecord::Migration[5.1]
  def change
    create_table :streaks do |t|
      t.boolean :positive

      t.timestamps
    end
  end
end

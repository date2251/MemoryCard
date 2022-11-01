class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.string :user_name
      t.integer :try_num

      t.timestamps
    end
  end
end

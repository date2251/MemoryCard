class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.string :username
      t.integer :trynum

      t.timestamps
    end
  end
end

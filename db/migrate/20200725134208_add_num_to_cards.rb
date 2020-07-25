class AddNumToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :num, :int
  end
end

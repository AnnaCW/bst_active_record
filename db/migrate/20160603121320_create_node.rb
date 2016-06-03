class CreateNode < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :value
      t.integer :right_id
      t.integer :left_id
    end
  end
end

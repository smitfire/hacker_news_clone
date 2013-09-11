class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :up
      t.integer :down
    end
  end
end

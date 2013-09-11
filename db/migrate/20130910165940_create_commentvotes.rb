class CreateCommentvotes < ActiveRecord::Migration
  def change
    create_table :commentvotes do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :up
      t.integer :down
    end
  end
end

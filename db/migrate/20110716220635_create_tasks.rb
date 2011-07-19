class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
			t.string :title
			t.text :description
			t.integer :user_id
			t.integer :priority
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end

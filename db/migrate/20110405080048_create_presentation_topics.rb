class CreatePresentationTopics < ActiveRecord::Migration
  def self.up
    create_table :presentation_topics do |t|
      t.string :title
      t.text :description
      t.integer :duration, :default => 0
      t.integer :votes, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :presentation_topics
  end
end

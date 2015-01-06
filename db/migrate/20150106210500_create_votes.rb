class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :flat, index: true
      t.integer :upvote

      t.timestamps
    end
  end
end

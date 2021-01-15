class CreateUserProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :user_proposals do |t|
      t.references :proposal, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

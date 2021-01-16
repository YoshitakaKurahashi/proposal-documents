class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.string  :title,        null: false
      t.string  :detail,       null: false
      t.date    :term_start,   null: false
      t.date    :term_end,     null: false
      t.string  :target_group, null: false
      t.string  :numeric,      null: false
      t.integer :budget,       null: false
      t.string  :payment,      null: false
      t.timestamps
    end
  end
end

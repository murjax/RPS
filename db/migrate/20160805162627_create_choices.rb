class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :choice
      t.references :game
      t.timestamps
    end
  end
end

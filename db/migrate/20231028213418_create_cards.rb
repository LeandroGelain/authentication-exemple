class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.string :current_lang
      t.string :foreign_lang
      t.string :image

      t.timestamps
    end
  end
end

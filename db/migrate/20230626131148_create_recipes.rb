class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false, default: ""
      t.integer :preparation_time
      t.integer :cooking_time
      t.text :description, null: false, default: ""
      t.boolean :public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

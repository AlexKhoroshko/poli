class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.references :appointment, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

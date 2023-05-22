class CreateDoctorCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_categories do |t|
      t.references :doctor, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.text :name
      t.integer :counter

      t.timestamps
    end
  end
end

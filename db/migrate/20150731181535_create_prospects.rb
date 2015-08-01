class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :full_name
      t.date :date_of_marriage
      t.string :county_of_marriage
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :resided_how_long
      t.string :email
      t.string :phone
      t.string :number_of_children
      t.string :ages
      t.boolean :co_own_business
      t.boolean :co_own_property

      t.timestamps
    end
  end
end

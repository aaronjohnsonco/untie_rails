class AddMarriageDateToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :marriage_date, :string
  end
end

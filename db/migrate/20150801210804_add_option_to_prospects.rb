class AddOptionToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :option, :string
  end
end

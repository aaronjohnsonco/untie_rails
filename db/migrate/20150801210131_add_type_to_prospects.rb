class AddTypeToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :type, :string
  end
end

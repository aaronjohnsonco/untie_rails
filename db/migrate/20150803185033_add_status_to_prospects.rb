class AddStatusToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :status, :string
  end
end

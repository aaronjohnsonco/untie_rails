class AddFullNameSpouseToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :full_name_spouse, :string
  end
end

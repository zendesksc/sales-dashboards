class AddRegionIdToDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :departments, :region_id, :integer
  end
end

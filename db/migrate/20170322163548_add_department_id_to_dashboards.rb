class AddDepartmentIdToDashboards < ActiveRecord::Migration[5.0]
  def change
    add_column :dashboards, :department_id, :integer
  end
end

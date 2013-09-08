class AddOrganizationIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :organization_id, :integer
  end
end

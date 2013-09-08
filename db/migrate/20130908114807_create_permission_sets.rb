class CreatePermissionSets < ActiveRecord::Migration
  def change
    create_table :permission_sets do |t|
      t.boolean :create__organizations
      t.boolean :create__memberships

      t.timestamps
    end
  end
end

class AddCanCreateOrganizationToApplicationSettings < ActiveRecord::Migration[8.0]
  def change
    add_column :application_settings, :can_create_organization, :boolean, default: false, null: false
  end
end

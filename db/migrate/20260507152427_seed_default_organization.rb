class SeedDefaultOrganization < ActiveRecord::Migration[8.0]
  def up
    return if Organizations::Organization.exists?(id: 1)

    Organizations::Organization.create!(id: 1, name: 'Default', path: 'default')
  end

  def down
    Organizations::Organization.delete(1)
  end
end

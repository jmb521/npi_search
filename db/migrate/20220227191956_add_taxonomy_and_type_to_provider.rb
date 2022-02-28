class AddTaxonomyAndTypeToProvider < ActiveRecord::Migration[7.0]
  def change
    add_column :providers, :taxonomy, :string
    add_column :providers, :enumeration_type, :string
  end
end

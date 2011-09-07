class AddAbbrToSite < ActiveRecord::Migration
  def change
    add_column :sites, :abbr, :string
  end
end

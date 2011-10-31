class AddNotesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :note, :text
  end
end

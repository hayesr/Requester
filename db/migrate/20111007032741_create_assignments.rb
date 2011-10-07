class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :need, :user
      t.timestamps
    end
  end
end

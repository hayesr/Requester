class RemoveDenialMessageIdFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :denial_message_id
  end

  def down
    add_column :events, :denial_message_id, :integer
  end
end

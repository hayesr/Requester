class AddDenialMessageIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :denial_message_id, :integer
  end
end

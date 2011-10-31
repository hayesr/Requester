class AddDenialMessageTextToEvents < ActiveRecord::Migration
  def change
    add_column :events, :denial_message_text, :text
  end
end

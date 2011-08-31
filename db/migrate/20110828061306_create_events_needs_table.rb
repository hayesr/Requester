class CreateEventsNeedsTable < ActiveRecord::Migration
  def change
    create_table :events_needs, :id => false do |t|
      t.references :event, :need
    end
  end

end
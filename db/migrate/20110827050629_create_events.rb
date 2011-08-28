class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :requester
      t.string :requester_email
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.integer :site_id
      t.string :area
      t.string :state

      t.timestamps
    end
  end
end

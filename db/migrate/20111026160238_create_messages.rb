class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.references :messageable, :polymorphic => true
      t.timestamps
    end
  end
end

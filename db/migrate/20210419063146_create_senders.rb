class CreateSenders < ActiveRecord::Migration[6.1]
  def change
    create_table(:senders, primary_key: [:mail_id]) do |t|
      t.integer :mail_id
      t.integer :user_id
      t.string :name, :limit => 50, :null => false
      t.boolean :read_status, default: false
      t.boolean :snoozed_status, default: false
      t.boolean :important_status, default: false
      t.boolean :starred_status, default: false
      t.boolean :trash_status, default: false

      t.timestamps
    end
  end
end
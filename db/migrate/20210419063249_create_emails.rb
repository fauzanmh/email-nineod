class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :name
      t.string :title
      t.integer :category_id
      t.text :message
      t.boolean :status, default: true

      t.timestamps
    end
  end
end

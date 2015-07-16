class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :chat, index: true, foreign_key: true
      t.integer :rating, null: false
      t.text :comment
      t.references :sender_id
      t.references :recipient_id

      t.timestamps null: false
    end
  end
end

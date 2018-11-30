class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :number
      t.string :nature
      t.string :subject
      t.string :text
      t.string :options, array: true, default: []

      t.timestamps
    end
  end
end

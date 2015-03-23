class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :question, :string
      t.column :answer_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end

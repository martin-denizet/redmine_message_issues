class CreateMessageIssues < ActiveRecord::Migration
  def change
    create_table :message_issues do |t|
      t.integer :message_id
      t.integer :issue_id
    end
    add_index :message_issues, :message_id
  end
end

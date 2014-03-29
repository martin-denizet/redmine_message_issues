class CreateUniqIndex < ActiveRecord::Migration
  def change
    add_index :message_issues, [:message_id, :issue_id], :unique => true
  end
end

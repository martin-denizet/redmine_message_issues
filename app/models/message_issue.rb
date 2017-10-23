class MessageIssue < ActiveRecord::Base
  unloadable

  belongs_to :issue
  belongs_to :message

  validates :issue, presence: true
  validates :message, presence: true

  validates :issue_id, :uniqueness => { :scope => :message_id }


end

class MessageIssue < ActiveRecord::Base
  unloadable

  belongs_to :issue
  belongs_to :message


end

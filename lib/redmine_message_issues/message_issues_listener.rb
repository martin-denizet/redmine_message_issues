class MessageIssueListener < Redmine::Hook::ViewListener
  render_on :view_issues_sidebar_issues_bottom, :partial => 'message_issues/list_messages'
end
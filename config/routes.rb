# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do

  match 'messages/:message_id/message_issues/new', :controller => 'message_issues', :action => 'new', :via => [:get]
  match 'messages/:message_id/message_issues/new', :controller => 'message_issues', :action => 'create', :via => [:post]

  match 'messages/:message_id/message_issues/:message_issue_id/delete', :controller => 'message_issues', :action => 'delete', :via => [:delete]
end
require 'redmine'


Rails.configuration.to_prepare do
  require_dependency 'redmine_message_issues/message_issues_hook'
end


Redmine::Plugin.register :redmine_message_issues do
  name 'Redmine Message Issues'
  author 'Martin DENIZET'
  url 'https://github.com/martin-denizet/redmine_message_issues'
  author_url 'http://martin-denizet.com'
  description 'Allows to link Issues to a Forum Message'
  version '0.1.1'

  requires_redmine :version_or_higher => '2.0.0'

  project_module :message_issues do

    permission :delete_message_issues, {
        :message_issues => :delete
    }

    permission :add_message_issues, {
        :message_issues => [:new, :create]
    }

    permission :view_message_issues, {
        :message_issues => :show
    }
  end

end
module RedmineMessageIssuesHooks
  class Hooks < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context={})

      request_params = context[:controller].request.filtered_parameters
      # Only inject the javascript in the relevant controller/action
      if request_params['controller'] == 'messages' and request_params['action'] == 'show'

        context[:controller].send(:render_to_string, {
            :partial => 'message_issues/view_layouts_base_html_head',
            :locals => context
        })
      end

    end
  end
end


module RedmineMessageIssuesHooks
  class Hooks < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context={})
      controller = context[:controller]
      request_params = controller.request.filtered_parameters
      # Only inject the javascript in the relevant controller/action
      if request_params['controller'] == 'messages' and request_params['action'] == 'show' and
          (controller.view_context.authorize_for('message_issues', 'show') or controller.view_context.authorize_for('message_issues', 'show'))

        controller.send(:render_to_string, {
            :partial => 'message_issues/view_layouts_base_html_head',
            :locals => context
        })
      end

    end
  end
end


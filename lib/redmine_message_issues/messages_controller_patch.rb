require_dependency 'messages_controller'

module MessageIssues
  module MessagesControllerPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
        unloadable

        alias_method_chain :show, :message_issues
      end
    end

    module InstanceMethods
      def show_with_message_issues

        header_string = "<script type='text/javascript'>
$( document ).ready(function() {
var html= '<div id=\"redmine_message_issues\" style=\"float:right;\">';"

        if User.current.allowed_to?(:add_message_issues, @project)
          header_string += "html +='#{view_context.link_to(view_context.image_tag('link.png', :style => 'vertical-align: middle;')+' Link issue',
                                                           {:controller => 'message_issues', :action => 'new', :message_id => @message.id},
                                                           :remote => true,
                                                           :method => 'get',
                                                           :title => l(:label_relation_new),
                                                           :tabindex => 200)}';"
        end

        header_string += "html += '<div id=\"message_issues\">#{view_context.escape_javascript(view_context.render :partial => 'message_issues/list')}</div><div id=\"new_message_issue\"></div></div>';"

        header_string += "$(html).insertBefore($('#content .message').first());
});
</script>"
        content_for :header_tags, header_string.html_safe if User.current.allowed_to?(:view_message_issues, @project)

        show_without_message_issues
      end

    end
  end
end

MessagesController.send(:include, MessageIssues::MessagesControllerPatch)

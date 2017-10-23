class MessageIssuesController < ApplicationController
  unloadable

  before_filter :find_message, :only => [:new, :create, :delete]
  before_filter :find_project, :only => [:new, :create, :delete]
  before_filter :authorize

  def new
    @message_issue = MessageIssue.new

    respond_to do |format|
      format.js
    end
  end


  def create

    @message_issue = MessageIssue.new
    issue_id = params[:message_issue][:issue_id].to_i
    begin
      issue = Issue.find(issue_id)
      @message_issues_error = Setting.cross_project_issue_relations?
      unless Setting.cross_project_issue_relations?
        raise Exception::Unauthorized.new unless issue.project_id == @project.id
      end
      @message_issue.issue = issue
      @message_issue.message = @message
      @message_issue.save!
    rescue ActiveRecord::RecordNotFound
      @message_issues_error = I18n.translate(:mi_issue_does_not_exist, {:issue_id => issue_id})
    rescue ActiveRecord::RecordInvalid
      @message_issues_error = I18n.translate(:mi_duplicate_record, {:issue_id => issue_id})
    rescue Exception::Unauthorized
      @message_issues_error = I18n.translate(:mi_cross_project_relations_forbidden, {:issue_id => issue_id})
    end

    respond_to do |format|
      format.js
    end
  end

  def show

  end

  def delete
    @message_issue = MessageIssue.delete(params[:message_issue_id])
    respond_to do |format|
      format.js
    end
  end


  private

  def find_message
    @message = Message.find(params[:message_id])
  end

  def find_project
    @board = Board.find(params[:board_id])
    @project = Project.find(@board.project_id)
  end


end

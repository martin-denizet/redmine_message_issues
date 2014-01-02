class MessageIssuesController < ApplicationController
  unloadable

  before_filter :find_message, :only => [:new, :create, :delete]
  #before_filter :authorize

  def new
    @message_issue=MessageIssue.new

    respond_to do |format|
      format.js
    end
  end


  def create
    @message_issue=MessageIssue.new(params[:message_issue])
    @message_issue.message=@message
    @message_issue.save
    respond_to do |format|
      format.js
    end
  end

  def show

  end

  def delete
    @message_issue=MessageIssue.delete(params[:message_issue_id])
    respond_to do |format|
      format.js
    end
  end


  private

  def find_message
    @message = Message.find(params[:message_id])
  end

end

class CommentObserver < ActiveRecord::Observer
  def after_commit(comment)
    action = if comment.persisted?
               'comments.new'
             else
               'comments.destroy'
             end
    CommentJob.perform_later(action, comment.as_json.to_json)
  end

end
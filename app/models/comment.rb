class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :text, length: { maximum: 140 }

  delegate :full_name, to: :user, allow_nil: true

  #after_commit :notify!

  def as_json(_ = nil)
    {
      id: id,
      text: text,
      user_id: user_id,
      product_id: product_id,
      nick: full_name || 'Guest'
    }
  end

  private

=begin
  def notify!
    action = if persisted?
               'comments.new'
             else
               'comments.destroy'
             end
    # WsQueue.instance.publish(action, self)

    Pusher.trigger('broadcast', action, as_json)
  end
=end
end

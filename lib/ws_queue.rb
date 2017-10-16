class WsQueue
  include Singleton

  def initialize
    @connection = Bunny.new
    @connection.start
    @channel = @connection.create_channel
    @queue = @channel.queue('broadcast', auto_delete: true)
    @x = @channel.default_exchange
  end


  def publish(action, obj)
    message = {
      action: action,
      data: obj
    }.to_json
    @x.publish(message, routing_key: @queue.name)
  end

  class << self
    def publish(action, obj)
      instance.publish(action, obj)
    end
  end
end

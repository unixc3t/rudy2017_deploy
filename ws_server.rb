require 'em-websocket'
require 'bunny'
require 'json'

ws_connections = []

conn = Bunny.new
conn.start

ch = conn.create_channel

q  = ch.queue('broadcast', auto_delete: true)

q.subscribe do |_delivery_info, _metadata, payload|
  puts payload
  ws_connections.each do |ws|
    ws.send(payload)
  end
end

EM.run do
  EM::WebSocket.run(host: '0.0.0.0', port: 8080) do |ws|
    ws.onopen do |_handshake|
      puts 'someone connection'
      ws_connections << ws
    end

    ws.onclose do
      ws_connections.delete(ws)
    end

    # ws.onmessage { |msg|
    # }
  end
end

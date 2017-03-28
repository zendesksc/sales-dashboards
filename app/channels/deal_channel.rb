class DealChannel < ApplicationCable::Channel
  def subscribed
    stream_from "deal_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def new(data)
    ActionCable.server.broadcast 'deal_channel', message: data['message']
  end
end

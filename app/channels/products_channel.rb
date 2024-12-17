class ProductsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream from "products"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

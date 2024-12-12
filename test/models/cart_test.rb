require "test_helper"

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add product method" do
    cart = Cart.create
    product = products(:ruby)
    line_item = cart.add_product(product)
    assert line_item.product.id == product.id
    assert line_item.price == product.price
  end

end

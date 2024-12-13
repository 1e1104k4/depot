require "test_helper"

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add product method" do
    cart = Cart.create
    product = products(:ruby)
    line_item = cart.add_product(product)
    line_item.save
    assert_equal product.id, line_item.product_id
    assert_equal product.price, line_item.price
    assert_equal 1, line_item.quantity
    # checking duplicate
    line_item = cart.add_product(product)
    line_item.save
    assert_equal 1, cart.line_items.size
    assert_equal 2, line_item.quantity
    # add unique items
    product_2 = products(:one)
    product_3 = products(:two)
    line_item_2 = cart.add_product(product_2)
    line_item_3 = cart.add_product(product_3)
    line_item_2.save
    line_item_3.save
    assert_equal 3, cart.line_items.size
    assert_equal 1, line_item_2.quantity
    assert_equal 1, line_item_3.quantity
  end

end

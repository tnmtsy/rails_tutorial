require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # This is NOT products test, explicit fixture name required.
  fixtures :products

  test "add two unique items" do
    cart = Cart.create

    product1 = products(:ruby)
    cart.add_product(product1.id)
    product2 = products(:two)
    cart.add_product(product2.id)

    assert_equal 2, cart.line_items.size
    assert_equal 59.49, cart.total_price
  end

  test "add duplicate items" do
    cart = Cart.create

    product = products(:ruby)
    current_item = cart.add_product(product.id)
    current_item.save
    current_item = cart.add_product(product.id)
    current_item.save

    assert_equal 1, cart.line_items.size
    assert_equal 49.50 * 2, cart.total_price
  end

end

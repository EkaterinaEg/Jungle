require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  it 'validate that name cannot be blank' do
    category = Category.new(name: 'trees')
    product = Product.new(
      name: nil,
      price_cents: 10,
      quantity: 20,
      category: category
    )
    product.valid?

    expect(product.errors.full_messages).to include("Name can't be blank")
  end
  it 'validate that quantity cannot be blank' do
    category = Category.new(name: 'trees')
    product = Product.new(
      name: 'rose',
      price_cents: 10,
      quantity: nil,
      category: category
    )
    product.valid?

    expect(product.errors.full_messages).to include("Quantity can't be blank")
  end
  it 'validate that category cannot be blank' do
    product = Product.new(
      name: 'rose',
      price_cents: 10,
      quantity: 20,
      category: nil
    )
    product.valid?

    expect(product.errors.full_messages).to include("Category can't be blank")
  end
  it 'validate that price cannot be blank' do
    category = Category.new(name: 'trees')
    product = Product.new(
      name: 'rose',
      price_cents: nil,
      quantity: 20,
      category: category
    )
    product.valid?

    expect(product.errors.full_messages).to include("Price can't be blank")
  end
  it 'validate that a product is saved with all required fields' do
    category = Category.new(name: 'trees')
    product = Product.new(
      name: 'rose',
      price_cents: 10,
      quantity: 20,
      category: category
    )

    expect(product.save).to be_truthy
    end
  end

end




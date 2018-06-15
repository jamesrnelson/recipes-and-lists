require 'rails_helper'

describe OutsideIngredient do
  describe 'instance methods' do
    context '#format_quantity' do
      it 'should reformat many different inappropriate formats' do
        attrs1 = { amount: 1.0, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi1 = OutsideIngredient.new(attrs1)
        attrs2 = { amount: 0.33, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi2 = OutsideIngredient.new(attrs2)
        attrs3 = { amount: 0.66, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi3 = OutsideIngredient.new(attrs3)
        attrs4 = { amount: 1.33, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi4 = OutsideIngredient.new(attrs4)
        attrs5 = { amount: 1.66, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi5 = OutsideIngredient.new(attrs5)
        attrs6 = { amount: 0.25, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi6 = OutsideIngredient.new(attrs6)
        attrs7 = { amount: 1.25, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi7 = OutsideIngredient.new(attrs7)
        attrs8 = { amount: 0.5, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi8 = OutsideIngredient.new(attrs8)
        attrs9 = { amount: 1.5, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi9 = OutsideIngredient.new(attrs9)
        attrs10 = { amount: 0.75, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi10 = OutsideIngredient.new(attrs10)
        attrs11 = { amount: 1.75, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi11 = OutsideIngredient.new(attrs11)
        attrs12 = { amount: 1.85, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi12 = OutsideIngredient.new(attrs12)
        attrs13 = { amount: 1, unit: 'teaspoons', name: 'food', aisle: 'food'}
        oi13 = OutsideIngredient.new(attrs13)

        expect(oi1.formatted_quantity).to eq('1')
        expect(oi2.formatted_quantity).to eq('1/3')
        expect(oi3.formatted_quantity).to eq('2/3')
        expect(oi4.formatted_quantity).to eq('1 1/3')
        expect(oi5.formatted_quantity).to eq('1 2/3')
        expect(oi6.formatted_quantity).to eq('1/4')
        expect(oi7.formatted_quantity).to eq('1 1/4')
        expect(oi8.formatted_quantity).to eq('1/2')
        expect(oi9.formatted_quantity).to eq('1 1/2')
        expect(oi10.formatted_quantity).to eq('3/4')
        expect(oi11.formatted_quantity).to eq('1 3/4')
        expect(oi12.formatted_quantity).to eq('1.85')
        expect(oi13.formatted_quantity).to eq('1')
      end
    end
  end
end

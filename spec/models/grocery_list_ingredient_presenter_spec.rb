require 'rails_helper'

describe GroceryListIngredientPresenter do
  describe 'instance methods' do
    context '#format_quantity(quantity)' do
      it 'should reformat many different inappropriate formats' do
        user = create(:user)
        grocery_list = user.grocery_lists.create(title: 'A list')
        subject = GroceryListIngredientPresenter.new(user.id, grocery_list.id)

        expect(subject.format_quantity('0.33')).to eq('1/3')
        expect(subject.format_quantity('0.66')).to eq('2/3')
        expect(subject.format_quantity('1.33')).to eq('1 1/3')
        expect(subject.format_quantity('1.66')).to eq('1 2/3')
        expect(subject.format_quantity('0.25')).to eq('1/4')
        expect(subject.format_quantity('1.25')).to eq('1 1/4')
        expect(subject.format_quantity('0.5')).to eq('1/2')
        expect(subject.format_quantity('1.5')).to eq('1 1/2')
        expect(subject.format_quantity('0.75')).to eq('3/4')
        expect(subject.format_quantity('1.75')).to eq('1 3/4')
        expect(subject.format_quantity('1.0')).to eq('1')
        expect(subject.format_quantity('1.8')).to eq('1.8')
      end
    end
  end
end

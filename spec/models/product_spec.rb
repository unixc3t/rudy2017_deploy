require 'rails_helper'
RSpec.describe Product, type: :model do
  it { should have_many(:likes) }
  it { should have_and_belong_to_many(:liked_users).class_name('User') }

  context 'Likeable' do
    context '#add_like' do
      let(:product) { create(:product) }
      let(:user) { create(:user) }

      it do
        expect(product.like_count).to eq 0
        product.add_like!(user)
        expect(product.like_count).to eq 1
      end
    end
  end
end
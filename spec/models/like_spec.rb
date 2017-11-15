require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:product) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:product) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:product_id) }
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  # ensure Post model has a 1:m relationship with the Comment model
  it { should have_many(:comments).dependent(:destroy) }
  it { should belong_to(:user) }
  # ensure columns title and body are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end

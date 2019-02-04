require 'rails_helper'

RSpec.describe Comment, type: :model do
  # ensure an comment belongs to a single post
  it { should belong_to(:post) }
  # ensure column name is present before saving
  it { should validate_presence_of(:body) }
end

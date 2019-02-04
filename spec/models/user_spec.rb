require 'rails_helper'

RSpec.describe User, type: :model do
  # ensure User model has a 1:m relationship with the Post model
  it { should have_many(:posts) }
  # ensure columns title and body are present before saving
  it { should validate_presence_of(:nickname) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_secure_password }
end

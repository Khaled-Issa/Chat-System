require 'rails_helper'

RSpec.describe Application, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:chat_count) }
  it { should validate_presence_of(:applications_token) }
end

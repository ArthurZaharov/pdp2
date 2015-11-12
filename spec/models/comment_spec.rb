require "rails_helper"

describe Comment do
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_uniqueness_of :content }
  it { is_expected.to belong_to :article }
end

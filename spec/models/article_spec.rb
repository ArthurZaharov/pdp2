require 'rails_helper'

describe Article do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :content }
end

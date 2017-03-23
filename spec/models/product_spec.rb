require "rails_helper"

RSpec.describe Product, type: :model do
  it { is_expected.to respond_to(:uuid) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:price) }
  it { is_expected.to monetize(:price) }
end

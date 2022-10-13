require 'rails_helper'

RSpec.describe Season, type: :model do
  it { should have_many :storms }

  # describe 'In Season Model' do
  #   describe '#method' do
  #     it 'Will...'
  #   end
  # end
end
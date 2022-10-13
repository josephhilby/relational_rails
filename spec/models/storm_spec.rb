require 'rails_helper'

RSpec.describe Storm, type: :model do
  it { should belong_to :season }

  # describe 'In Storm Model' do
  #   describe '#method' do
  #     it 'Will...'
  #   end
  # end
end
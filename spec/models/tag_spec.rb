RSpec.describe Tag do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:category) }
  end
end

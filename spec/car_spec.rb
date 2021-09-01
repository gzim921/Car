RSpec.describe Car do
  it 'has a version number' do
    expect(Car::VERSION).not_to be nil
  end
end

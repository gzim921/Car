RSpec.describe Car::MyCar do
  let(:bmw) { Car::MyCar.new('BMW', 2015, 'Blue') }
  let(:defects) { 'Water pump, Oil leak' }

  it 'creates new instance' do
    expect(bmw).to be_instance_of(Car::MyCar)
  end

  it 'has current speed defined 0' do
    expect(bmw.current_speed).to eq(0)
  end

  it 'speeding up' do
    bmw.speed_up(80)
    expect(bmw.current_speed).to eq(80)
  end

  it 'speeding by default' do
    bmw.speed_up
    expect(bmw.current_speed).to eq(Car::MyCar::SPEED_OFFSET)
  end

  it 'slowing down' do
    bmw.slow_down
    expect(bmw.current_speed).to eq(-Car::MyCar::SPEED_OFFSET)
  end

  it 'paints the car' do
    bmw.spray_paint :green
    expect(bmw.color).to eq(:green)
  end

  it 'has no defects' do
    expect(bmw.defects).to be_empty
  end

  it 'showing defects' do
    bmw.add_defect(defects)
    expect(bmw.service_info).to include(defects)
    puts bmw.service_info
  end

  it 'will lists all defect' do
    bmw.add_defect(defects)
    expect(bmw.service_info).to include("Defects to be fixed: #{defects}")
    puts bmw.service_info
  end

  it 'will remove water pump defect' do
    bmw.add_defect(defects)
    bmw.repair('water pump')
    expect(bmw.defects).not_to include('Oil leak')
  end
end

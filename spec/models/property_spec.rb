require 'spec_helper'

# TODO: Add more tests? Test filter_by_params here too.
describe Property do
  it 'gets address reverse geocded' do
    property = Property.create(
      name: 'Test',
      bedroom_count: 10,
      latitude: 64.657421,
      longitude: -21.4048
    )
    property.address.should_not be_nil
  end
end
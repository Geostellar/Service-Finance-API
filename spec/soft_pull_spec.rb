require 'spec_helper'

describe ServiceFinance::SoftPull do
  subject { soft_pull.qualify options }
  let(:soft_pull) { ServiceFinance::SoftPull.new company, account, password }
  let(:first_name) { 'Test' }
  let(:last_name) { 'User' }
  let(:street_number) { '729' }
  let(:address) { '6th' }
  let(:street_type) { 'ST' }
  let(:city) { 'Washington' }
  let(:state_abbr) { 'DC' }
  let(:zip) { '20002' }
  let(:options) {
    {
      address: address,
      city: city,
      first_name: first_name,
      last_name: last_name,
      state_abbr: state_abbr,
      street_number: street_number,
      street_type: street_type,
      zip: zip
    }
  }

  it 'sends the expected options' do
    allow(soft_pull).to receive(:request).and_return double(response: double(body: '<COLOR>Blue</COLOR>'))
    expect(soft_pull.class).to receive(:post).with('/service.asp', query: {
      'MM_UserCompany' => company,
      'CompAccount' => account,
      'CompPassword' => password,
      firstname: first_name,
      lastname: last_name,
      streetnum: street_number,
      address: address,
      streettype: street_type,
      city: city,
      state: state_abbr,
      zip: zip
    })
    subject
  end

  it 'returns the color options' do
    expect(subject).to eq 'Black'
  end
end

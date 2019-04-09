
require 'oystercard'

describe Oystercard do
  it 'checks card balance is zero' do
    expect(subject.balance).to eq (0)
  end

describe "#top_up" do

    it { is_expected.to respond_to(:top_up).with(1).argument }

  it " can top up the balance" do
  expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

    it "raises an error if card balance is more then 90" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
    expect { subject.top_up(1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
end
end

describe "#deduct" do

  it { is_expected.to respond_to(:deduct).with(1).argument }

  it 'deducts an amount from the balance' do
    subject.top_up(20)
    expect{ subject.deduct 1}.to change{ subject.balance }.by -1
  end
end

describe "#touch_in" do

  it 'is initially not in a journey' do
  expect(subject).not_to be_in_journey
 end
end
end

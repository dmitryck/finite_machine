# encoding: utf-8

require 'spec_helper'

RSpec.describe FiniteMachine::EventsChain, '.add' do
  it "adds transitions" do
    transition = double(:transition)
    events_chain = described_class.new

    events_chain.add(:validated, transition)
    expect(events_chain[:validated]).to eq([transition])

    events_chain.add(:validated, transition)
    expect(events_chain[:validated]).to eq([transition, transition])
  end

  it "allows to chain add operations" do
    events_chain = described_class.new
    transition = double(:transition)

    events_chain.add(:go, transition).add(:start, transition)

    expect(events_chain.size).to eq(2)
  end
end

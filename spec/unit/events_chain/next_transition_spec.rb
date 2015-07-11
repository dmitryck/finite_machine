# encoding: utf-8

require 'spec_helper'

RSpec.describe FiniteMachine::EventsChain, '.next_transition' do
  let(:machine) { spy(:machine) }

  it "finds matching transition by name" do
    transition_a = double(:transition_a, current?: false)
    transition_b = double(:transition_b, current?: true)

    events_chain = described_class.new
    events_chain.add(:go, transition_a)
    events_chain.insert(:go, transition_b)

    expect(events_chain.next_transition(:go)).to eq(transition_b)
  end

  it "choses first available transition" do
    transition_a = double(:transition_a, current?: false)
    transition_b = double(:transition_b, current?: false)

    events_chain = described_class.new
    events_chain.add(:go, transition_a)
    events_chain.insert(:go, transition_b)

    expect(events_chain.next_transition(:go)).to eq(transition_a)
  end
end

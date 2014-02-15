require 'spec_helper'

describe Event do
  describe '.schedules' do
    let(:event){ FactoryGirl.create :event }
    let(:schedule){ FactoryGirl.create :schedule, event: event }

    before{ schedule.save }

    specify{ expect(event.schedules).to eq [schedule] }
  end

  describe '.members' do
    let(:event){ FactoryGirl.create :event }
    let(:member){ FactoryGirl.create :member, event: event }

    before{ member.save }

    specify{ expect(event.members).to eq [member] }
  end
end

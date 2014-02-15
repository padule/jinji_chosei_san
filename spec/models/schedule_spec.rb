require 'spec_helper'

describe Schedule do
  describe '.event' do
    let(:event){ FactoryGirl.create :event }
    let(:schedule){ FactoryGirl.create :schedule, event: event }

    specify{ expect(schedule.event).to eq event }
  end

  describe '.member_schedules' do
    let(:schedule){ FactoryGirl.create :schedule }
    let(:member_schedule){ FactoryGirl.create :member_schedule, schedule: schedule }

    before{ member_schedule.save }

    specify{ expect(schedule.member_schedules).to eq [member_schedule] }
  end
end

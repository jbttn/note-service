require 'spec_helper'

describe Note do
  describe "#create" do
    #let(:user) { Factory.build(:user) }
    #let(:note) { Factory(:note) }
    
    it "should have a title" do
      create(:note, title: 'Foobar').title.should_not be_nil
    end
    it "should have correct owner" do
      user = create(:user)
      create(:note, owner: user).owner.should eq(user)
    end
    it "should be created with 0 hits" do
      note = create(:note).hits.should eq(0)
    end
  end
  
  describe "#increment_hits" do
    it "should increment once" do
      note = create(:note)
      note.increment_hits
      note.hits.should eq(1)
    end
  end
  
  it "sorts recent notes in descending order by created_at time" do
    Note.delete_all
    n1 = Factory(:note, created_at: 2.weeks.ago)
    n2 = Factory(:note, created_at: Time.now)
    Note.recent.should eq([n2, n1])
  end
end

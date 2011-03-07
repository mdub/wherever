require 'spec_helper'

describe Wherever do

  include Wherever

  describe "#where" do

    it "returns a Wherever::Builder" do
      self.where.should be_kind_of(Wherever::Builder)
    end

  end

end

describe Wherever::Builder do

  include Wherever

  it "accepts arbitrary messages" do
    where.whatever
  end

  describe "#to_proc" do

    it "returns a Proc that replays the message chain" do
      builder = (where < 5)
      predicate = builder.to_proc
      predicate.call(1).should be_true
      predicate.call(6).should be_false
    end

  end

end

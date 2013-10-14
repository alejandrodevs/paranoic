require 'spec_helper'

module Paranoic
  module ActsAsParanoic
    describe Sanitizer do
      describe "#sanitize!" do
        it "returns params sanitized" do
          params = {user: {name: "name", age: 10}}
          subject.stub(:attributes_allowed).and_return([:name])
          subject.sanitize!(params, :user)
          expected = {user: {name: "name"}}
          expect(params).to eq expected
        end
      end
    end
  end
end

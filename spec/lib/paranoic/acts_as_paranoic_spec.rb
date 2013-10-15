require 'spec_helper'

module Paranoic
  describe ActsAsParanoic do
    let!(:subject){ ActionController::Base.send(:include, described_class).tap(&:new) }

    describe "#acts_as_paranoic" do
      it "active @acts_as_paranoic flag" do
        subject.acts_as_paranoic
        expect(subject.instance_variable_get(:@acts_as_paranoic)).to be_true
      end

      it "calls before_filter method with correct params" do
        subject.should_receive(:before_filter).with(:sanitize_params_paranoically)
        subject.acts_as_paranoic
      end
    end

    describe "#acts_as_paranoic?" do
      context "when acts as paranoic" do
        it "returns true" do
          subject.instance_variable_set(:@acts_as_paranoic, true)
          expect(subject.acts_as_paranoic?).to be_true
        end
      end

      context "when doesn't act as paranoic" do
        it "returns false" do
          subject.instance_variable_set(:@acts_as_paranoic, false)
          expect(subject.acts_as_paranoic?).to be_false
        end
      end
    end

    describe "#sanitize_params_paranoically" do
      context "when doesn't respond to current_user method" do
        it "raise an error" do
          expect{ subject.sanitize_params_paranoically }.to raise_error
        end
      end

      context "when responds to current_user method" do
        let!(:sanitizer){ ActsAsParanoic::Sanitizer.new }
        let!(:params){ {user: {name: "name", age: 10} }}
        let!(:current_user){ "CurrentUser" }

        before :each do
          subject.acts_as_paranoic :user
          subject.stub(:current_user).and_return(current_user)
          subject.stub(:params).and_return(params)
        end

        it "instances ActsAsParanoic::Sanitizer class and calls sanitize! method" do
          ActsAsParanoic::Sanitizer.should_receive(:new).
            exactly(1).times.
            and_return(sanitizer)

          sanitizer.should_receive(:sanitize!).
            with(current_user, params, :user).
            exactly(1).times

          subject.sanitize_params_paranoically
        end
      end
    end
  end
end

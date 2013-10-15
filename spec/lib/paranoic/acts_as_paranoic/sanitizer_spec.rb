require 'spec_helper'

module Paranoic
  module ActsAsParanoic
    describe Sanitizer do
      let(:current_user) { "CurrentUser" }

      describe "#sanitize!" do
        it "returns params sanitized" do
          params = {
            :user => {
              :name => "name",
              :age  => 10,
              :posts_attributes => [
                {
                  :title => "title",
                  :body  => "content"
                },
                {
                  :title => "title",
                  :body  => "content"
                }
              ]
            }
          }
          params_expected = {
            :user => {
              :name => "name",
              :posts_attributes => [
                {
                  :title => "title"
                },
                {
                  :title => "title"
                }
              ]
            }
          }
          subject.sanitize!(current_user, params, :user)
          expect(params).to eq params_expected
        end
      end
    end
  end
end

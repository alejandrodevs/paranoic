require 'spec_helper'

module Paranoic
  describe Role do
    describe "Accessible attributes" do
      it { expect(subject).to allow_mass_assignment_of(:name) }
    end

    describe "Columns" do
      it { expect(subject).to have_db_column(:id) }
      it { expect(subject).to have_db_column(:name).of_type(:string) }
      it { expect(subject).to have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
      it { expect(subject).to have_db_column(:updated_at).of_type(:datetime).with_options(:null => false) }
    end
  end
end

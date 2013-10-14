require 'spec_helper'

module Paranoic
  describe Role do
    describe "Accessible attributes" do
      it { expect(subject).to allow_mass_assignment_of(:name) }
      it { expect(subject).to allow_mass_assignment_of(:owner_id) }
      it { expect(subject).to allow_mass_assignment_of(:owner_type) }
    end

    describe "Columns" do
      it { expect(subject).to have_db_column(:id) }
      it { expect(subject).to have_db_column(:name).of_type(:string) }
      it { expect(subject).to have_db_column(:owner_id).of_type(:integer) }
      it { expect(subject).to have_db_column(:owner_type).of_type(:string) }
      it { expect(subject).to have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
      it { expect(subject).to have_db_column(:updated_at).of_type(:datetime).with_options(:null => false) }
    end
  end
end

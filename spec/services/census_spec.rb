require "rails_helper"

describe "Census service" do
  context ".get_token" do
    it "returns an access token", vcr: true do
      token = CensusService.get_token

      expect(token).to be_a String
    end
  end

  context ".get_data_by_github" do
    it "returns cohort name", vcr: true do
      data = CensusService.get_data_by_github("kheppenstall")

      expect(data[:cohort]).to be_a String
      expect(data[:cohort]).to_not be_empty
    end

    it "returns roles for student", vcr: true do
      data = CensusService.get_data_by_github("kheppenstall")

      expect(data[:roles]).to eq ["graduated"]
    end

    it "returns roles for staff", vcr: true do
      data = CensusService.get_data_by_github("allisonreusinger")

      expect(data[:roles]).to eq ["staff", "admin", "full-circle-reviewer"]
    end
  end
end

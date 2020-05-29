RSpec.describe AlBhed do
  describe "String#to_albhed" do
    it "should translate downcased latin alphabets into Al Bheds" do
      results = "abcdefghijklmnopqrstuvwxyz".to_albhed
      expect(results).to eq "ypltavkrezgmshubxncdijfqow"
    end

    it "should translate upcased latin alphabets into Al Bheds" do
      results = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".to_albhed
      expect(results).to eq "YPLTAVKREZGMSHUBXNCDIJFQOW"
    end

    it "should keep it if no latin alphabets" do
      no_latins = "1234567890,. !?"
      results = no_latins.to_albhed
      expect(results).to eq no_latins
    end
  end
end

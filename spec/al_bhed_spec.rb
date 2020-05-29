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

  describe "String#from_albhed" do
    it "should translate downcased Al Bheds into latin alphabets" do
      results = "ypltavkrezgmshubxncdijfqow".from_albhed
      expect(results).to eq "abcdefghijklmnopqrstuvwxyz"
    end

    it "should translate upcased Al Bheds into latin alphabets" do
      results = "YPLTAVKREZGMSHUBXNCDIJFQOW".from_albhed
      expect(results).to eq "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    end

    it "should keep it if no latin alphabets" do
      no_latins = "1234567890,. !?"
      results = no_latins.from_albhed
      expect(results).to eq no_latins
    end
  end
end

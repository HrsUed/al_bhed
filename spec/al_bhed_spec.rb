RSpec.describe AlBhed do
  describe "String#to_albhed" do
    context "translate English" do
      it "should translate downcased latin alphabets into Al Bheds" do
        results = "abcdefghijklmnopqrstuvwxyz".to_albhed
        expect(results).to eq "ypltavkrezgmshubxncdijfqow"
      end

      it "should translate upcased latin alphabets into Al Bheds" do
        results = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".to_albhed
        expect(results).to eq "YPLTAVKREZGMSHUBXNCDIJFQOW"
      end
    end

    context "translate Japanese" do
      context "Hira Kana" do
        it "should translate あ行 Kana into Al Bheds" do
          results = "あいうえお".to_albhed
          expect(results).to eq "ワミフネト"
        end

        it "should translate か行 Kana into Al Bheds" do
          results = "かきくけこ".to_albhed
          expect(results).to eq "アチルテヨ"
        end

        it "should translate さ行 Kana into Al Bheds" do
          results = "さしすせそ".to_albhed
          expect(results).to eq "ラキヌヘホ"
        end

        it "should translate た行 Kana into Al Bheds" do
          results = "たちつてと".to_albhed
          expect(results).to eq "サヒユセソ"
        end

        it "should translate な行 Kana into Al Bheds" do
          results = "なにぬねの".to_albhed
          expect(results).to eq "ハシスメオ"
        end

        it "should translate は行 Kana into Al Bheds" do
          results = "はひふへほ".to_albhed
          expect(results).to eq "マリクケロ"
        end

        it "should translate ま行 Kana into Al Bheds" do
          results = "まみむめも".to_albhed
          expect(results).to eq "ヤイツレコ"
        end

        it "should translate や行 Kana into Al Bheds" do
          results = "やゆよ".to_albhed
          expect(results).to eq "タヲモ"
        end

        it "should translate ら行 Kana into Al Bheds" do
          results = "らりるれろ".to_albhed
          expect(results).to eq "ナニウエノ"
        end

        it "should translate わ行 Kana into Al Bheds" do
          results = "わをん".to_albhed
          expect(results).to eq "カムン"
        end

        it "should translate が行 Kana into Al Bheds" do
          results = "がぎぐげご".to_albhed
          expect(results).to eq "ダジヅデゾ"
        end

        it "should translate ざ行 Kana into Al Bheds" do
          results = "ざじずぜぞ".to_albhed
          expect(results).to eq "バギブゲボ"
        end

        it "should translate だ行 Kana into Al Bheds" do
          results = "だぢづでど".to_albhed
          expect(results).to eq "ガビグベゴ"
        end

        it "should translate ば行 Kana into Al Bheds" do
          results = "ばびぶべぼ".to_albhed
          expect(results).to eq "ザヂズゼド"
        end

        it "should translate ぱ行 Kana into Al Bheds" do
          results = "ぱぴぷぺぽ".to_albhed
          expect(results).to eq "プペパポピ"
        end
      end

      context "Kata Kana" do
        it "should translate ア行 Kana into Al Bheds" do
          results = "アイウエオ".to_albhed
          expect(results).to eq "ワミフネト"
        end

        it "should translate カ行 Kana into Al Bheds" do
          results = "カキクケコ".to_albhed
          expect(results).to eq "アチルテヨ"
        end

        it "should translate サ行 Kana into Al Bheds" do
          results = "サシスセソ".to_albhed
          expect(results).to eq "ラキヌヘホ"
        end

        it "should translate タ行 Kana into Al Bheds" do
          results = "タチツテト".to_albhed
          expect(results).to eq "サヒユセソ"
        end

        it "should translate ナ行 Kana into Al Bheds" do
          results = "ナニヌネノ".to_albhed
          expect(results).to eq "ハシスメオ"
        end

        it "should translate ハ行 Kana into Al Bheds" do
          results = "ハヒフヘホ".to_albhed
          expect(results).to eq "マリクケロ"
        end

        it "should translate マ行 Kana into Al Bheds" do
          results = "マミムメモ".to_albhed
          expect(results).to eq "ヤイツレコ"
        end

        it "should translate ヤ行 Kana into Al Bheds" do
          results = "ヤユヨ".to_albhed
          expect(results).to eq "タヲモ"
        end

        it "should translate ラ行 Kana into Al Bheds" do
          results = "ラリルレロ".to_albhed
          expect(results).to eq "ナニウエノ"
        end

        it "should translate ワ行 Kana into Al Bheds" do
          results = "ワヲン".to_albhed
          expect(results).to eq "カムン"
        end

        it "should translate ガ行 Kana into Al Bheds" do
          results = "ガギグゲゴ".to_albhed
          expect(results).to eq "ダジヅデゾ"
        end

        it "should translate ザ行 Kana into Al Bheds" do
          results = "ザジズゼゾ".to_albhed
          expect(results).to eq "バギブゲボ"
        end

        it "should translate ダ行 Kana into Al Bheds" do
          results = "ダヂヅデド".to_albhed
          expect(results).to eq "ガビグベゴ"
        end

        it "should translate バ行 Kana into Al Bheds" do
          results = "バビブベボ".to_albhed
          expect(results).to eq "ザヂズゼド"
        end

        it "should translate パ行 Kana into Al Bheds" do
          results = "パピプペポ".to_albhed
          expect(results).to eq "プペパポピ"
        end
      end
    end

    it "should keep it if no substitution" do
      no_latins = "1234567890,. !?日本語ぁぃぅぇぉっ"
      results = no_latins.to_albhed
      expect(results).to eq no_latins
    end
  end

  describe "String#from_albhed" do
    context "translate English" do
      it "should translate downcased Al Bheds into latin alphabets" do
        results = "ypltavkrezgmshubxncdijfqow".from_albhed
        expect(results).to eq "abcdefghijklmnopqrstuvwxyz"
      end

      it "should translate upcased Al Bheds into latin alphabets" do
        results = "YPLTAVKREZGMSHUBXNCDIJFQOW".from_albhed
        expect(results).to eq "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      end
    end

    context "translate Japanese" do
      it "should translate Al Bheds into Kana"
      it "should translate Al Bheds into Dakuon-Kana"
    end

    it "should keep it if no substitution" do
      no_latins = "1234567890,. !?日本語ぁぃぅぇぉっ"
      results = no_latins.from_albhed
      expect(results).to eq no_latins
    end
  end
end

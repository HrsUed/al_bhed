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
        it "should translate あ行 into Al Bheds" do
          results = "あいうえお".to_albhed
          expect(results).to eq "ワミフネト"
        end

        it "should translate か行 into Al Bheds" do
          results = "かきくけこ".to_albhed
          expect(results).to eq "アチルテヨ"
        end

        it "should translate さ行 into Al Bheds" do
          results = "さしすせそ".to_albhed
          expect(results).to eq "ラキヌヘホ"
        end

        it "should translate た行 into Al Bheds" do
          results = "たちつてと".to_albhed
          expect(results).to eq "サヒユセソ"
        end

        it "should translate な行 into Al Bheds" do
          results = "なにぬねの".to_albhed
          expect(results).to eq "ハシスメオ"
        end

        it "should translate は行 into Al Bheds" do
          results = "はひふへほ".to_albhed
          expect(results).to eq "マリクケロ"
        end

        it "should translate ま行 into Al Bheds" do
          results = "まみむめも".to_albhed
          expect(results).to eq "ヤイツレコ"
        end

        it "should translate や行 into Al Bheds" do
          results = "やゆよ".to_albhed
          expect(results).to eq "タヲモ"
        end

        it "should translate ら行 into Al Bheds" do
          results = "らりるれろ".to_albhed
          expect(results).to eq "ナニウエノ"
        end

        it "should translate わ行 into Al Bheds" do
          results = "わをん".to_albhed
          expect(results).to eq "カムン"
        end

        it "should translate が行 into Al Bheds" do
          results = "がぎぐげご".to_albhed
          expect(results).to eq "ダジヅデゾ"
        end

        it "should translate ざ行 into Al Bheds" do
          results = "ざじずぜぞ".to_albhed
          expect(results).to eq "バギブゲボ"
        end

        it "should translate だ行 into Al Bheds" do
          results = "だぢづでど".to_albhed
          expect(results).to eq "ガビグベゴ"
        end

        it "should translate ば行 into Al Bheds" do
          results = "ばびぶべぼ".to_albhed
          expect(results).to eq "ザヂズゼド"
        end

        it "should translate ぱ行 into Al Bheds" do
          results = "ぱぴぷぺぽ".to_albhed
          expect(results).to eq "プペパポピ"
        end
      end

      context "Kata Kana" do
        it "should translate ア行 into Al Bheds" do
          results = "アイウエオ".to_albhed
          expect(results).to eq "ワミフネト"
        end

        it "should translate カ行 into Al Bheds" do
          results = "カキクケコ".to_albhed
          expect(results).to eq "アチルテヨ"
        end

        it "should translate サ行 into Al Bheds" do
          results = "サシスセソ".to_albhed
          expect(results).to eq "ラキヌヘホ"
        end

        it "should translate タ行 into Al Bheds" do
          results = "タチツテト".to_albhed
          expect(results).to eq "サヒユセソ"
        end

        it "should translate ナ行 into Al Bheds" do
          results = "ナニヌネノ".to_albhed
          expect(results).to eq "ハシスメオ"
        end

        it "should translate ハ行 into Al Bheds" do
          results = "ハヒフヘホ".to_albhed
          expect(results).to eq "マリクケロ"
        end

        it "should translate マ行 into Al Bheds" do
          results = "マミムメモ".to_albhed
          expect(results).to eq "ヤイツレコ"
        end

        it "should translate ヤ行 into Al Bheds" do
          results = "ヤユヨ".to_albhed
          expect(results).to eq "タヲモ"
        end

        it "should translate ラ行 into Al Bheds" do
          results = "ラリルレロ".to_albhed
          expect(results).to eq "ナニウエノ"
        end

        it "should translate ワ行 into Al Bheds" do
          results = "ワヲン".to_albhed
          expect(results).to eq "カムン"
        end

        it "should translate ガ行 into Al Bheds" do
          results = "ガギグゲゴ".to_albhed
          expect(results).to eq "ダジヅデゾ"
        end

        it "should translate ザ行 into Al Bheds" do
          results = "ザジズゼゾ".to_albhed
          expect(results).to eq "バギブゲボ"
        end

        it "should translate ダ行 into Al Bheds" do
          results = "ダヂヅデド".to_albhed
          expect(results).to eq "ガビグベゴ"
        end

        it "should translate バ行 into Al Bheds" do
          results = "バビブベボ".to_albhed
          expect(results).to eq "ザヂズゼド"
        end

        it "should translate パ行 into Al Bheds" do
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
      context "Hira Kana" do
        it "should translate Al Bheds into あ行" do
          results = "ワミフネト".from_albhed(hira: true)
          expect(results).to eq "あいうえお"
        end

        it "should translate Al Bheds into か行" do
          results = "アチルテヨ".from_albhed(hira: true)
          expect(results).to eq "かきくけこ"
        end

        it "should translate Al Bheds into さ行" do
          results = "ラキヌヘホ".from_albhed(hira: true)
          expect(results).to eq "さしすせそ"
        end

        it "should translate Al Bheds into た行" do
          results = "サヒユセソ".from_albhed(hira: true)
          expect(results).to eq "たちつてと"
        end

        it "should translate Al Bheds into な行" do
          results = "ハシスメオ".from_albhed(hira: true)
          expect(results).to eq "なにぬねの"
        end

        it "should translate Al Bheds into は行" do
          results = "マリクケロ".from_albhed(hira: true)
          expect(results).to eq "はひふへほ"
        end

        it "should translate Al Bheds into ま行" do
          results = "ヤイツレコ".from_albhed(hira: true)
          expect(results).to eq "まみむめも"
        end

        it "should translate Al Bheds into や行" do
          results = "タヲモ".from_albhed(hira: true)
          expect(results).to eq "やゆよ"
        end

        it "should translate Al Bheds into ら行" do
          results = "ナニウエノ".from_albhed(hira: true)
          expect(results).to eq "らりるれろ"
        end

        it "should translate Al Bheds into わ行" do
          results = "カムン".from_albhed(hira: true)
          expect(results).to eq "わをん"
        end

        it "should translate Al Bheds into が行" do
          results = "ダジヅデゾ".from_albhed(hira: true)
          expect(results).to eq "がぎぐげご"
        end

        it "should translate Al Bheds into ざ行" do
          results = "バギブゲボ".from_albhed(hira: true)
          expect(results).to eq "ざじずぜぞ"
        end

        it "should translate Al Bheds into だ行" do
          results = "ガビグベゴ".from_albhed(hira: true)
          expect(results).to eq "だぢづでど"
        end

        it "should translate Al Bheds into ば行" do
          results = "ザヂズゼド".from_albhed(hira: true)
          expect(results).to eq "ばびぶべぼ"
        end

        it "should translate Al Bheds into ぱ行" do
          results = "プペパポピ".from_albhed(hira: true)
          expect(results).to eq "ぱぴぷぺぽ"
        end
      end

      context "Kata Kana" do
        it "should translate Al Bheds into ア行" do
          results = "ワミフネト".from_albhed
          expect(results).to eq "アイウエオ"
        end

        it "should translate Al Bheds into カ行" do
          results = "アチルテヨ".from_albhed
          expect(results).to eq "カキクケコ"
        end

        it "should translate Al Bheds into サ行" do
          results = "ラキヌヘホ".from_albhed
          expect(results).to eq "サシスセソ"
        end

        it "should translate Al Bheds into タ行" do
          results = "サヒユセソ".from_albhed
          expect(results).to eq "タチツテト"
        end

        it "should translate Al Bheds into ナ行" do
          results = "ハシスメオ".from_albhed
          expect(results).to eq "ナニヌネノ"
        end

        it "should translate Al Bheds into ハ行" do
          results = "マリクケロ".from_albhed
          expect(results).to eq "ハヒフヘホ"
        end

        it "should translate Al Bheds into マ行" do
          results = "ヤイツレコ".from_albhed
          expect(results).to eq "マミムメモ"
        end

        it "should translate Al Bheds into ヤ行" do
          results = "タヲモ".from_albhed
          expect(results).to eq "ヤユヨ"
        end

        it "should translate Al Bheds into ラ行" do
          results = "ナニウエノ".from_albhed
          expect(results).to eq "ラリルレロ"
        end

        it "should translate Al Bheds into ワ行" do
          results = "カムン".from_albhed
          expect(results).to eq "ワヲン"
        end

        it "should translate Al Bheds into ガ行" do
          results = "ダジヅデゾ".from_albhed
          expect(results).to eq "ガギグゲゴ"
        end

        it "should translate Al Bheds into ザ行" do
          results = "バギブゲボ".from_albhed
          expect(results).to eq "ザジズゼゾ"
        end

        it "should translate Al Bheds into ダ行" do
          results = "ガビグベゴ".from_albhed
          expect(results).to eq "ダヂヅデド"
        end

        it "should translate Al Bheds into バ行" do
          results = "ザヂズゼド".from_albhed
          expect(results).to eq "バビブベボ"
        end

        it "should translate Al Bheds into パ行" do
          results = "プペパポピ".from_albhed
          expect(results).to eq "パピプペポ"
        end
      end
    end

    it "should keep it if no substitution" do
      no_latins = "1234567890,. !?日本語ぁぃぅぇぉっ"
      results = no_latins.from_albhed
      expect(results).to eq no_latins
    end
  end
end

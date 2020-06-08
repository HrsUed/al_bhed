# frozen_string_literal: false

require "al_bhed/version"

# This is a namespace so as to open up for a built-in String class
module AlBhed
  class Error < StandardError; end

  UPCASES           = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z].freeze
  UPCASED_ALBHEDS   = %w[Y P L T A V K R E Z G M S H U B X N C D I J F Q O W].freeze
  DOWNCASES         = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze
  DOWNCASED_ALBHEDS = %w[y p l t a v k r e z g m s h u b x n c d i j f q o w].freeze

  HIRA_KANA         = %w[あ い う え お か き く け こ さ し す せ そ た ち つ て と な に ぬ ね の は ひ ふ へ ほ ま み む め も や ゆ よ ら り る れ ろ わ を ん].freeze
  KATA_KANA         = %w[ア イ ウ エ オ カ キ ク ケ コ サ シ ス セ ソ タ チ ツ テ ト ナ ニ ヌ ネ ノ ハ ヒ フ ヘ ホ マ ミ ム メ モ ヤ ユ ヨ ラ リ ル レ ロ ワ ヲ ン].freeze
  HIRA_DAKUON       = %w[が ぎ ぐ げ ご ざ じ ず ぜ ぞ だ ぢ づ で ど ば び ぶ べ ぼ ぱ ぴ ぷ ぺ ぽ].freeze
  KATA_DAKUON       = %w[ガ ギ グ ゲ ゴ ザ ジ ズ ゼ ゾ ダ ヂ ヅ デ ド バ ビ ブ ベ ボ パ ピ プ ペ ポ].freeze
  KANA_ALBHEDS      = %w[ワ ミ フ ネ ト ア チ ル テ ヨ ラ キ ヌ ヘ ホ サ ヒ ユ セ ソ ハ シ ス メ オ マ リ ク ケ ロ ヤ イ ツ レ コ タ ヲ モ ナ ニ ウ エ ノ カ ム ン].freeze
  DAKUON_ALBHEDS    = %w[ダ ジ ヅ デ ゾ バ ギ ブ ゲ ボ ガ ビ グ ベ ゴ ザ ヂ ズ ゼ ド プ ペ パ ポ ピ].freeze

  # a built-in String class
  class ::String
    # Translate into Al Bhed
    #
    # Example:
    #   >> "Hi!".to_albhed
    #   => "Re!"
    #
    # Arguments:
    #   nothing
    def to_albhed
      chars.inject("") do |results, c|
        if latin?(c)
          results << from_english_to_albhed(c)
        else
          results << from_japanese_to_albhed(c)
        end
      end
    end

    # Translate Al Bhed into English
    #
    # Example:
    #   >> "Re!".from_albhed
    #   => "Hi!"
    #
    # Arguments:
    #   hira: (Boolean)
    def from_albhed(hira: false)
      chars.inject("") do |results, c|
        if latin?(c)
          results << from_albhed_to_english(c)
        else
          results << from_albhed_to_japanese(c, hira: hira)
        end
      end
    end

    private

    def latin?(char)
      ("a".."z").include?(char) || ("A".."Z").include?(char)
    end

    def from_english_to_albhed(char)
      if (idx = DOWNCASES.index(char))
        DOWNCASED_ALBHEDS[idx]
      elsif (idx = UPCASES.index(char))
        UPCASED_ALBHEDS[idx]
      else
        char
      end
    end

    def from_albhed_to_english(char)
      if (idx = DOWNCASED_ALBHEDS.index(char))
        DOWNCASES[idx]
      elsif (idx = UPCASED_ALBHEDS.index(char))
        UPCASES[idx]
      else
        char
      end
    end

    def from_japanese_to_albhed(char)
      if (idx = HIRA_KANA.index(char) || KATA_KANA.index(char))
        KANA_ALBHEDS[idx]
      elsif (idx = HIRA_DAKUON.index(char) || KATA_DAKUON.index(char))
        DAKUON_ALBHEDS[idx]
      else
        char
      end
    end

    def from_albhed_to_japanese(char, hira: false)
      if (idx = KANA_ALBHEDS.index(char))
        hira ? HIRA_KANA[idx] : KATA_KANA[idx]
      elsif (idx = DAKUON_ALBHEDS.index(char))
        hira ? HIRA_DAKUON[idx] : KATA_DAKUON[idx]
      else
        char
      end
    end
  end
end

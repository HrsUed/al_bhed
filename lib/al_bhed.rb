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
end

# a built-in String class
class String
  # Translate into Al Bhed
  #
  # Example:
  #   >> "Hi!".to_albhed
  #   => "Re!"
  #
  # Arguments:
  #   nothing
  def to_albhed
    tr(AlBhed::UPCASES.join, AlBhed::UPCASED_ALBHEDS.join)
      .tr(AlBhed::DOWNCASES.join, AlBhed::DOWNCASED_ALBHEDS.join)
      .tr((AlBhed::HIRA_KANA + AlBhed::KATA_KANA).join, AlBhed::KANA_ALBHEDS.join * 2)
      .tr((AlBhed::HIRA_DAKUON + AlBhed::KATA_DAKUON).join, AlBhed::DAKUON_ALBHEDS.join * 2)
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
    tr(AlBhed::UPCASED_ALBHEDS.join, AlBhed::UPCASES.join)
      .tr(AlBhed::DOWNCASED_ALBHEDS.join, AlBhed::DOWNCASES.join)
      .tr(AlBhed::KANA_ALBHEDS.join, (hira ? AlBhed::HIRA_KANA : AlBhed::KATA_KANA).join)
      .tr(AlBhed::DAKUON_ALBHEDS.join, (hira ? AlBhed::HIRA_DAKUON : AlBhed::KATA_DAKUON).join)
  end
end

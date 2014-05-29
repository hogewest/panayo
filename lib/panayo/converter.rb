require 'nkf'

module Panayo
  class Converter
    # 濁点
    DAKUTEN = [0x3099, 0x309b, 0xff9e]
    # 半濁点
    HANDAKUTEN = [0x309a, 0x309c, 0xff9f]
    # 濁音
    DAKUON = 'ガギグゲゴザジズゼゾダヂヅデドバビブベボヴ'
    # 半濁音
    HANDAKUON = 'パピプペポ'
    # 片仮名
    KANA = [*'ァ'..'ン']
    # 変換
    HENKAN_TABLE = {
      'ガ' => 'カ', 'ギ' => 'キ', 'グ' => 'ク', 'ゲ' => 'ケ', 'ゴ' => 'コ',
      'ザ' => 'サ', 'ジ' => 'シ', 'ズ' => 'ス', 'ゼ' => 'セ', 'ゾ' => 'ソ',
      'ダ' => 'タ', 'ヂ' => 'チ', 'ヅ' => 'ツ', 'デ' => 'テ', 'ド' => 'ト',
      'バ' => 'ハ', 'ビ' => 'ヒ', 'ブ' => 'フ', 'ベ' => 'ヘ', 'ボ' => 'ホ',
      'ヴ' => 'ウ',
      'パ' => 'ハ', 'ピ' => 'ヒ', 'プ' => 'フ', 'ペ' => 'ヘ', 'ポ' => 'ホ'
    }

    class << self
      def remove_dakuten(text)
        result = text.gsub(/[#{DAKUON}]/, HENKAN_TABLE)
        (result.codepoints - DAKUTEN).pack("U*")
      end

      def remove_handakuten(text)
        result = text.gsub(/[#{HANDAKUON}]/, HENKAN_TABLE)
        (result.codepoints - HANDAKUTEN).pack("U*")
      end

      def to_kana(text)
        to_zen_kana(text.tr('ぁ-ん', 'ァ-ン'))
      end

      def to_zen_kana(text)
        NKF.nkf('-w -X', text)
      end

      def to_hanayo(text)
        text.each_char.map{ |char| kana?(char) ? "#{char}゛" : char }.join
      end

      def kana?(char)
        KANA.include?(char)
      end
    end
  end
end

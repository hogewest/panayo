require 'unf'
require 'nkf'

module Panayo
  class Converter
    KANA = [*'ァ'..'ン']
    # 濁点
    DAKUTEN = [0x3099, 0x309b, 0xff9e]
    # 半濁点
    HANDAKUTEN = [0x309a, 0x309c, 0xff9f]

    class << self
      def remove_dakuten(text)
        (text.to_nfd.codepoints - DAKUTEN).pack("U*")
      end

      def remove_handakuten(text)
        (text.to_nfd.codepoints - HANDAKUTEN).pack("U*")
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

require "panayo/version"
require "panayo/converter"

module Panayo
  class << self
    def say(text)
      words = Panayo::Converter.remove_dakuten(text)
      words = Panayo::Converter.remove_handakuten(words)
      words = Panayo::Converter.to_kana(words)
      Panayo::Converter.to_hanayo(words)
    end
  end
end

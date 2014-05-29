require "panayo/version"
require "panayo/converter"

module Panayo
  def self.say(text)
    return if text.nil?

    words = Panayo::Converter.to_kana(text)
    words = Panayo::Converter.remove_dakuten(words)
    words = Panayo::Converter.remove_handakuten(words)
    Panayo::Converter.to_hanayo(words)
  end
end

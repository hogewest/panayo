require 'spec_helper'

describe Panayo do
  it 'has a version number' do
    expect(Panayo::VERSION).not_to be nil
  end

  it 'say' do
    expect(Panayo.say(nil)).to be nil
    expect(Panayo.say('')).to eq('')
    expect(Panayo.say('小泉花陽')).to eq('小泉花陽')
    expect(Panayo.say('こいずみぱなよ')).to eq('コ゛イ゛ス゛ミ゛ハ゛ナ゛ヨ゛')
    expect(Panayo.say('コイズミパナヨ')).to eq('コ゛イ゛ス゛ミ゛ハ゛ナ゛ヨ゛')
    expect(Panayo.say('ｺｲｽﾞﾐﾊﾟﾅﾖ')).to eq('コ゛イ゛ス゛ミ゛ハ゛ナ゛ヨ゛')
    expect(Panayo.say('Hanayo is very cute!')).to eq('Hanayo is very cute!')
    expect(Panayo.say('いえにかえっちゃったの？')).to eq('イ゛エ゛ニ゛カ゛エ゛ッ゛チ゛ャ゛ッ゛タ゛ノ゛？')
  end
end

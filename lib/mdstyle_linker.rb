# frozen_string_literal: true

require 'mdstyle_linker/version'

module MdstyleLinker
  require 'open-uri'

  def self.mdstyle(url)
    begin
      res = open(url, read_timeout: 2)
      # break if res.status != ["200", "OK"]
      raise InternetConnectionError, 'ネット環境がアレみたいです' if res.status[0] != '200'

      # res.readはプレーンなstringで返ってくる
      # EOFがめんどくさいので最初に弾いちゃう
      title = res.read.gsub(/[\r\n\t]/, '').match(/<head.*>.*<title>(.+?)<\/title>.*<\/head>/)[1]
      "[#{title}](#{url})"
    rescue StandardError => e
      puts e
      exit
    end
  end
end

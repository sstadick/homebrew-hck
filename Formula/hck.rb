class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.6.7"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.7/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "47085bb427b2b015b5a2079234ddcbfe50bdeaf2a10c78a2afdfaedde864b3ea"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.7/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "e4d8650a450620f29c888fcb09aaf1ba503ce7ab5a35edef307bfe299d985cf2"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

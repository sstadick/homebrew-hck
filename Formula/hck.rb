class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.6.1"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.1/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "ad148df78bfd6d8a282914651e5e18a53c07207db4493be30be6cef1b8fe067d"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.1/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "aeec42f4236676d2b78bd7746add676c7c4f5c816b648baf4a7ece20676ec5bc"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

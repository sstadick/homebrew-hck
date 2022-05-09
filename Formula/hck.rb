class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.7.2"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.7.2/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "ce0d86a98e7e46b36566431069e3c5a793616db43d25b311ec806cabf0c0a1ef"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.7.2/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "3d76c3ce9606bf68660cd0ab4f3a0cf8bb3f05f9ae3d1b4009d4802c9c10b0ff"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.6.6"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.6/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "4b3aa33d83ab26c6d8ed42193c706665d7faa390a1a6a0101c6e50ba6215f4cf"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.6/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "d29fd77660bc2a516e9f4d4fc35ebcee4c7bbb56993f6d39a62213c3c85dbba1"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

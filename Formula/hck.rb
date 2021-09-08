class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.6.3"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.3/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "6d87104aa3c4e1d4f5cc7114a439bb6908ea8a97257a5c2b2a7416f403e87a38"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.3/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "7275a8c9770345e2b3e94271afd78d538b3d4ce0511fb815d2a0aab17d13b58f"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

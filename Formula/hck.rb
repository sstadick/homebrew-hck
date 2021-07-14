class Hck < Formula
  desc "Faster and more featureful clone of cut"
  version "0.5.1"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.5.1/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "4b56955c78f4a74c6b99b4ae3cceaafe75c058c0cbd374cc97ebca43d34492f9"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.5.1/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "5d5f7866382250cd629d185562690b8ed190906bdb457f7abec3eec8a4d3ca47"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.6.2"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.2/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "5f66b5cb9eb0c4e212dfb39fbd8efc0acced44b12e3b6b27c76be45c00a18412"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.2/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "62f53c643707d6c6a8e68948f389bf4202d268bd87534a820981af5c60a5900d"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

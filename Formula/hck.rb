class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.5.3"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.5.3/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "970ce4cd90b4168eed367b81503d64deaa7166b9a896a4c6d6e9310c3857cf56"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.5.3/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "b1546d1d48a33863186ce983cedc05c6639e000b9572c86c3eed97062bb84217"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

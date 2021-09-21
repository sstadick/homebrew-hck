class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.6.5"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.5/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "fd4755808bd64f1df9e8a3cd6169898b91bdb9e70ab145095353bf2ba18bfd5b"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.6.5/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "05eeaa7de582f73111dfddc1f97aedb7a9b11859eebdf26f5ccea295f2957c22"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

class Hck < Formula
  desc "Faster and more featureful clone of cut"
  homepage "https://github.com/sstadick/hck"
  license any_of: ["MIT", "Unlicense"]
  version "0.5.4"

  if OS.linux?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.5.4/hck-linux-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-linux-amd64"
    sha256 "ef49aaa4e4740ee2f1f1d63813413c1fe08074b083afd340c1555bf0811387f7"
  elsif OS.mac?
    # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.5.4/hck-macos-amd64 | shasum -a 256
    url "https://github.com/sstadick/hck/releases/download/v#{version}/hck-macos-amd64"
    sha256 "869fde3775d5f249338b8d1ae87e8707a27333a98297562904cbf700c8db20cf"
  end

  def install
    `mv hck-* hck`
    bin.install "hck"
  end
end

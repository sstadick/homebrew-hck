# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hck < Formula
    version "0.3.3"
    desc "A faster and more featureful clone of cut."
    homepage "https://github.com/sstadick/hck"
    license any_of: ["MIT", "UNLICENSE"]

    if OS.linux?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.3/hck-linux-amd64-src.tar.gz | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/v0.3.3/hck-linux-amd64-src.tar.gz"
        sha256 "5b5192f550dcdf4cc1c12549f08fa673712b50341669786e614111f6dd054eb0"
    elsif OS.mac?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.3/hck-macos-amd64-src.tar.gz | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/v0.3.3/hck-macos-amd64-src.tar.gz"
        sha256 "da31c43b43441c5376f5cfd11a69ad3b8c7282674e82ac25e33e1cee58975f33"
    end

    def install
        bin.install "hck"
    end

    depends_on "rust" => :build

    def install
      ENV["RUSTFLAGS"] = "-Ctarget-cpu=native -Cllvm-args=-pgo-warn-missing-function -Cprofile-use=#{Dir.pwd}/pgo-data/merged.profdata"
      system "cargo", "build", "--release", "--bin", "hck"
      bin.install "target/release/hck"
    end
  end
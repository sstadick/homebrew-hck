# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hck < Formula
    version "0.3.2"
    desc "A faster and more featureful clone of cut."
    homepage "https://github.com/sstadick/hck"
    license any_of: ["MIT", "UNLICENSE"]

    if OS.linux?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.2/hck-linux-amd64-src.tar.gz | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/v0.3.2/hck-linux-amd64-src.tar.gz"
        sha256 "cf739e4a8207fd5dc7273bb7cf31846945b6f7245890d6f2cc2883e459b6dc03"
    elsif OS.mac?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.2/hck-macos-amd64-src.tar.gz | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/v0.3.2/hck-macos-amd64-src.tar.gz"
        sha256 "c84b4eecf467cc887d74760e059f63734bb4b0996fbdf420175bea186706806a"
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
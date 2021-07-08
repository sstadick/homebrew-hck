# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hck < Formula
    version "0.3.6"
    desc "A faster and more featureful clone of cut."
    homepage "https://github.com/sstadick/hck"
    license any_of: ["MIT", "UNLICENSE"]

    if OS.linux?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.6/hck-linux-amd64-src.tar.gz | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/v0.3.6/hck-linux-amd64-src.tar.gz"
        sha256 "d83dca83c6a4c3e3e26f226352871a82dca1b36364afa8c8aecc63c328de3e66"
    elsif OS.mac?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.6/hck-macos-amd64-src.tar.gz | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/v0.3.6/hck-macos-amd64-src.tar.gz"
        sha256 "f9e5e8c0f1157c1c443df5492463c12b48c59b086074e3cfb68aef2a972e99b4"
    end

    def install
        bin.install "hck"
    end

    depends_on "wget" => :build
    depends_on "rust" => :build
    depends_on "llvm" => :build

    def install
    #   ENV["RUSTFLAGS"] = "-Ctarget-cpu=native -Cllvm-args=-pgo-warn-missing-function -Cprofile-use=#{Dir.pwd}/pgo-data/merged.profdata"
    #   system "cargo", "build", "--release", "--bin", "hck"
      system "bash", "pgo_local.sh"
      bin.install "target/release/hck"
    end
  end
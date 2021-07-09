# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hck < Formula
    version "v0.4.2"
    desc "A faster and more featureful clone of cut."
    homepage "https://github.com/sstadick/hck"
    license any_of: ["MIT", "UNLICENSE"]

    if OS.linux?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.4.2/hck-linux-amd64 | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/#{version}/hck-linux-amd64"
        sha256 "e2a4be8eef3568af9a6b7b780d1a15a80617121b3973cba763345ee4ec8b6016"
    elsif OS.mac?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.4.2/hck-macos-amd64 | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/#{version}/hck-macos-amd64"
        sha256 "fa5af7e5db08164ced8309fb137a4cc0a3bc5770388591323ddc2c84582c9578"
    end

    def install
        `mv hck-* hck`
        bin.install "hck"
    end

    # def install
    # #   ENV["RUSTFLAGS"] = "-Ctarget-cpu=native -Cllvm-args=-pgo-warn-missing-function -Cprofile-use=#{Dir.pwd}/pgo-data/merged.profdata"
    # #   system "cargo", "build", "--release", "--bin", "hck"
    #   system "bash", "pgo_local.sh"
    #   bin.install "target/release/hck"
    # end
  end
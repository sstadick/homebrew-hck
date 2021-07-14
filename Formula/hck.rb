# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hck < Formula
    version "v0.5.0"
    desc "A faster and more featureful clone of cut."
    homepage "https://github.com/sstadick/hck"
    license any_of: ["MIT", "UNLICENSE"]

    if OS.linux?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.5.0/hck-linux-amd64 | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/#{version}/hck-linux-amd64"
        sha256 "fbc7b646d0c8b732debed1aa9753fec83c3c8d68d493a2056082a3164a66717d"
    elsif OS.mac?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.5.0/hck-macos-amd64 | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/#{version}/hck-macos-amd64"
        sha256 "d267e501301dc067a017ba8cae8b8b2a84f48023c32bc0aa5d059939f0257ce0"
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
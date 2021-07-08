# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hck < Formula
    version "v0.3.7"
    desc "A faster and more featureful clone of cut."
    homepage "https://github.com/sstadick/hck"
    license any_of: ["MIT", "UNLICENSE"]

    if OS.linux?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.7/hck-linux-amd64 | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/#{version}/hck-linux-amd64"
        sha256 "37c9651659b274858c4a0f3a547544ac717681ae4ccc0ffda80901e52b3be70c"
    elsif OS.mac?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.7/hck-macos-amd64 | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/#{version}/hck-macos-amd64"
        sha256 "4debd13c36a669ebbe290b4f8d3670f286ccc869412aa5343eb1e80fc0823e73"
    end

    def install
        `mv hck-moacos-amd hck`
        bin.install "hck"
    end

    # def install
    # #   ENV["RUSTFLAGS"] = "-Ctarget-cpu=native -Cllvm-args=-pgo-warn-missing-function -Cprofile-use=#{Dir.pwd}/pgo-data/merged.profdata"
    # #   system "cargo", "build", "--release", "--bin", "hck"
    #   system "bash", "pgo_local.sh"
    #   bin.install "target/release/hck"
    # end
  end
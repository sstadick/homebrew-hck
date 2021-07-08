# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Hck < Formula
    version "0.3.5.3"
    desc "A faster and more featureful clone of cut."
    homepage "https://github.com/sstadick/hck"
    license any_of: ["MIT", "UNLICENSE"]

    if OS.linux?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.5/hck-linux-amd64-src.tar.gz | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/v0.3.5/hck-linux-amd64-src.tar.gz"
        sha256 "d2422ec101b7e445b3a46f1c7cde3fca57357ae0eb0bb8a86317b9720c7f796d"
    elsif OS.mac?
        # wget -q -S -O - https://github.com/sstadick/hck/releases/download/v0.3.5/hck-macos-amd64-src.tar.gz | shasum -a 256
        url "https://github.com/sstadick/hck/releases/download/v0.3.5/hck-macos-amd64-src.tar.gz"
        sha256 "8f7952ce12fcd19a9a280af6b497ab49177714a8b385b8a95226e0c240422082"
    end

    def install
        bin.install "hck"
    end

    depends_on "wget" => :build
    depends_on "rust" => :build
    depends_on "rustup-init" => :build

    def install
    #   ENV["RUSTFLAGS"] = "-Ctarget-cpu=native -Cllvm-args=-pgo-warn-missing-function -Cprofile-use=#{Dir.pwd}/pgo-data/merged.profdata"
    #   system "cargo", "build", "--release", "--bin", "hck"
      system "rustup-init", "-y"
      system "rustup", "component", "add", "llvm-tools-preview"
      system "bash", "pgo_local.sh"
      bin.install "target/release/hck"
    end
  end
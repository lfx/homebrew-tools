class MacPortBar < Formula
  desc "Lightweight macOS menu bar utility listing locally running HTTP services"
  homepage "https://github.com/lfx/mac-port-bar"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/lfx/mac-port-bar/releases/download/v1.0.0/mac-port-bar_Darwin_arm64.tar.gz"
      sha256 "35cffa75d77b19231d6a8e3a188f800fda4f79304d4448b4f8b808d9eb0bbc8d"
    end

    on_intel do
      url "https://github.com/lfx/mac-port-bar/releases/download/v1.0.0/mac-port-bar_Darwin_x86_64.tar.gz"
      sha256 "3be17869acdd3d01f2f4a823a5abec8a8667bb696943d302727ded7d5705a924"
    end
  end

  def install
    bin.install "mac-port-bar"
  end

  test do
    assert_path_exists bin/"mac-port-bar"
    assert_predicate bin/"mac-port-bar", :executable?
  end
end

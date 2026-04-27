# typed: false
# frozen_string_literal: true

class GoShowMd < Formula
  desc "Lightweight macOS markdown file viewer and navigator"
  homepage "https://github.com/lfx/go-show-md"
  version "1.0.3"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/lfx/go-show-md/releases/download/v1.0.3/go-show-md_Darwin_arm64.tar.gz"
    sha256 "c3ae1593f6427e0cd56d758b622f1c4bb55ed502838a6a6b9db347fa91329fc2"
  end
  if Hardware::CPU.intel?
    url "https://github.com/lfx/go-show-md/releases/download/v1.0.3/go-show-md_Darwin_x86_64.tar.gz"
    sha256 "51fcae8c5ede7fff3397d1c7a0cef8615b406bfdc7a584b1dd4fafae54806d2d"
  end

  def install
    bin.install "go-show-md"
  end

  test do
    assert_path_exists bin/"go-show-md"
    assert_predicate bin/"go-show-md", :executable?
  end
end

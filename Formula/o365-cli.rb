class O365Cli < Formula
  desc "CLI tool for Microsoft 365 mail and calendar access via OAuth2"
  homepage "https://github.com/patrick-hofmann/o365-cli"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.0.1/o365-cli-darwin-arm64"
      sha256 "050c70e7858a766739c473694d1d335e65d375b8d2405a6c0545b11ec8aaaba0"
    else
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.0.1/o365-cli-darwin-amd64"
      sha256 "5166a6929e9d3e7f8907d547598f25bdf2d3a429325b900ec8646a6fcbc72e4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.0.1/o365-cli-linux-arm64"
      sha256 "a4c22e3ab22d9228966508e13b6a2ce080f88dd9bc63056d8fadb6b79af46a37"
    else
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.0.1/o365-cli-linux-amd64"
      sha256 "b1adc18b94829e079b3072c334283b55a1c0c6a87e47e65b08301dce25f49a4d"
    end
  end

  def install
    binary = Dir["o365-cli-*"].first || "o365-cli"
    bin.install binary => "o365-cli"
  end

  test do
    assert_match "o365-cli v2.0.1", shell_output("#{bin}/o365-cli version")
  end
end

class O365Cli < Formula
  desc "CLI tool for Microsoft 365 mail and calendar access via OAuth2"
  homepage "https://github.com/patrick-hofmann/o365-cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.0.0/o365-cli-darwin-arm64"
      sha256 "28a29b2414f44cb1c47c3b44ffd6cc960588c2873f9790e76fe2e536fc5be616"
    else
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.0.0/o365-cli-darwin-amd64"
      sha256 "ab5bf58a21e1e2e3c4001549780ccba57f59b06ea513943eaee4616b26632b44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.0.0/o365-cli-linux-arm64"
      sha256 "1fb5c6b73a0b5e2288f64bc772236db3eac140b6a255e987ccaec0e097ce5999"
    else
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.0.0/o365-cli-linux-amd64"
      sha256 "3d9327567e0780c771000d331d0085b31fee8a671d7c1e97b28138dc967c5f21"
    end
  end

  def install
    binary = Dir["o365-cli-*"].first || "o365-cli"
    bin.install binary => "o365-cli"
  end

  test do
    assert_match "o365-cli v2.0.0", shell_output("#{bin}/o365-cli version")
  end
end

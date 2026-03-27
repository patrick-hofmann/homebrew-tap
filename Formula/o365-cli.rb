class O365Cli < Formula
  desc "CLI tool for Microsoft 365 mail and calendar access via OAuth2"
  homepage "https://github.com/patrick-hofmann/o365-cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.1.0/o365-cli-darwin-arm64"
      sha256 "b0af02574feb037ab7fc59bd6d982006634145bef2514f973931eebd3b844093"
    else
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.1.0/o365-cli-darwin-amd64"
      sha256 "82da6c6f363a5bc4440548857492da4117f5e2e112520182e20181f9ced7f465"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.1.0/o365-cli-linux-arm64"
      sha256 "422f09200a29b22345b617ba2a543bc634551f0316e9b426ba8c409ee029c584"
    else
      url "https://github.com/patrick-hofmann/o365-cli/releases/download/v2.1.0/o365-cli-linux-amd64"
      sha256 "7cd4535632ec0f0b7ea722d4884a0f0153c5ad3942e7c9783ade4f60bd21034c"
    end
  end

  def install
    binary = Dir["o365-cli-*"].first || "o365-cli"
    bin.install binary => "o365-cli"
  end

  test do
    assert_match "o365-cli v2.1.0", shell_output("#{bin}/o365-cli version")
  end
end

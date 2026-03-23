class PrxSd < Formula
  desc "Open-source Rust antivirus engine with YARA-X and real-time protection"
  homepage "https://github.com/openprx/prx-sd"
  version "0.2.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/openprx/prx-sd/releases/download/v0.2.3/sd-macos-x86_64"
      sha256 "8162722b499efd663f05568c079bcc823288e31580fd4aa1d5c5c80eb6209eca"
    else
      url "https://github.com/openprx/prx-sd/releases/download/v0.2.3/sd-macos-aarch64"
      sha256 "3f083516b204e29c99df57ff35156c2c68d287b245c5517b27c9ea2f0a96aa5d"
    end
  end

  on_linux do
    url "https://github.com/openprx/prx-sd/releases/download/v0.2.3/sd-linux-x86_64"
    sha256 "e8027a461e16b03e22f39e7b482a7dbb095f9e4659f7c208617a3934019b77e9"
  end

  def install
    bin.install Dir["sd-*"].first => "sd"
  end

  def caveats
    <<~EOS
      PRX-SD installed. Quick start:
        sd scan /path/to/check
        sd update
        sd monitor /home /tmp
    EOS
  end

  test do
    assert_match "prx-sd", shell_output("\#{bin}/sd --version")
  end
end

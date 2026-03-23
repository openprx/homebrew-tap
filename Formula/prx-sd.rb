class PrxSd < Formula
  desc "Open-source Rust antivirus engine with YARA-X and real-time protection"
  homepage "https://github.com/openprx/prx-sd"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/openprx/prx-sd/releases/download/v0.2.1/sd-macos-x86_64"
      sha256 "36dbf1c57603976f8c2480785c30d74b7f4a6e3ba100b13f51d466984e8a6d05"
    else
      url "https://github.com/openprx/prx-sd/releases/download/v0.2.1/sd-macos-aarch64"
      sha256 "2422f0da731b0d24ec1073ee8323f84aa42ae977b32bb25f4137acb2f2eab943"
    end
  end

  on_linux do
    url "https://github.com/openprx/prx-sd/releases/download/v0.2.1/sd-linux-x86_64"
    sha256 "a772c3743ac1c12fbc539b350ad887e30ec11cf450476dd35a05e7c4c8e970a4"
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

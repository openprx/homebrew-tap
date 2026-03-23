class PrxSd < Formula
  desc "Open-source Rust antivirus engine with YARA-X and real-time protection"
  homepage "https://github.com/openprx/prx-sd"
  version "0.2.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/openprx/prx-sd/releases/download/v0.2.2/sd-macos-x86_64"
      sha256 "13203677863335fc7f9d76872a3feb71a851c2d4fd08cd6d60be6a9187faefed"
    else
      url "https://github.com/openprx/prx-sd/releases/download/v0.2.2/sd-macos-aarch64"
      sha256 "a6712b467e7f42a0382c18c3c1999729005220bdc1f611e55a5c9f4fbd0bb70e"
    end
  end

  on_linux do
    url "https://github.com/openprx/prx-sd/releases/download/v0.2.2/sd-linux-x86_64"
    sha256 "a51d6d1365fb9daa964c2fe323de576ada66baee78ad3772f55a4c2d40116c7c"
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

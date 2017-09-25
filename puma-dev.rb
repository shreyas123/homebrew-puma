class PumaDev < Formula
  desc "A tool to manage rack apps in development with puma"
  homepage "https://github.com/puma/puma-dev"
  url "https://github.com/puma/puma-dev/archive/5c92d487b83a50c44dc8864bbe8952328268a7cf.zip"
  sha256 "2a00b264676e211fc53f18ef627c58fb04d5083873f56a7cb4ee74de980e4716"
  version '0.20'

  def install
    bin.install "puma-dev"
  end

  test do
    require 'open3'
    puma_dev_bin = "#{bin}/puma-dev"
    ::Open3.popen3("#{puma_dev_bin} -h") do |_, _, stderr|
      assert_equal "Usage of #{puma_dev_bin}:", stderr.readlines.first.strip
    end
  end

  def caveats
    <<-EOS.undent
      Setup dev domains:
        sudo puma-dev -setup

      Install puma-dev as a launchd agent (required for port 80 usage):
        puma-dev -install

      To update to the latest release:
        puma-dev -install
    EOS
  end
end


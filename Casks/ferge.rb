cask "ferge" do
  version "0.1.0"
  sha256 "5088ac58902fce4984db07a1ea15235d077240882c4c0a3b197716a79eb9c896"

  url "https://github.com/wirecurl/ferge/releases/download/v#{version}/ferge-#{version}-macos.dmg"
  name "ferge"
  desc "Fast, keyboard-first file transfer client"
  homepage "https://github.com/wirecurl/ferge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "ferge.app"
  binary "#{appdir}/ferge.app/Contents/MacOS/ferge"

  zap trash: "~/Library/Application Support/ferge"

  caveats <<~EOS
    ferge is not signed with an Apple Developer ID yet, so macOS asks before
    its first start: open ferge once, then allow it under System Settings >
    Privacy & Security > "Open Anyway".
  EOS
end

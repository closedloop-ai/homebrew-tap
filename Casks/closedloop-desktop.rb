cask "closedloop-desktop" do
  version "0.17.1030"
  sha256 "0df8d6f4a5d21f3c363bc82611f1d19298e5e719b5b3e030d3e21adfc7f72dc2"

  url "https://github.com/closedloop-ai/closedloop-ai/releases/download/desktop-v#{version}/Closedloop-#{version}-universal.dmg"
  name "Closedloop"
  desc "Finds and analyzes the AI coding sessions on your machine"
  homepage "https://closedloop.ai/"

  auto_updates true
  depends_on macos: :monterey

  app "Closedloop.app"

  zap trash: [
    "~/Library/Application Support/Closedloop",
    "~/Library/Caches/ai.closedloop.desktop.ShipIt",
    # electron-updater names its cache after the app's package name, `desktop`.
    "~/Library/Caches/desktop-updater",
    "~/Library/Logs/Closedloop",
    "~/Library/Preferences/ai.closedloop.desktop.plist",
  ]
end

cask "closedloop-desktop" do
  version "0.17.1094"
  sha256 "a53d79148b312b49e67881e71b3461fd3a77986844ead6024290f7fedd54f0dc"

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

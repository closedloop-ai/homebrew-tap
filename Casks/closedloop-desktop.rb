cask "closedloop-desktop" do
  version "0.17.1072"
  sha256 "08a0087f4c559752194747af3b743890edd64ba2e6b1c6a1c54ff1000562165b"

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

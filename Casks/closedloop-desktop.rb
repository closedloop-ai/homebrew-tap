cask "closedloop-desktop" do
  version "0.17.1101"
  sha256 "29113058b47212954cb4b598ae1146dab935e514e42d48788468ce1af4b868e0"

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

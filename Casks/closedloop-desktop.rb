cask "closedloop-desktop" do
  version "0.17.1107"
  sha256 "7e97059d55ebf9d9d23554a4b0dde63ddb0a1a7908b0b57e8cab0354b23f02e0"

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

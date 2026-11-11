class Closedloop < Formula
  desc "Headless ClosedLoop session capture daemon and CLI"
  homepage "https://closedloop.ai"
  url "https://github.com/closedloop-ai/closedloop-ai/releases/download/closedloop-v0.17.0/closedloop-0.17.0.tar.gz"
  version "0.17.0"
  sha256 "9bfe8948228b98fc9d6a3c9b49e7c086b10cdfe64c8f9f3b032d3b1d3b53bd87"

  depends_on "node"

  def install
    # The tarball carries every platform's libsql prebuild; keep this one.
    native = "#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "x64"}"
    Dir["node_modules/@libsql/{darwin,linux}-*"].each do |prebuild|
      rm_r prebuild unless File.basename(prebuild).start_with?(native)
    end

    libexec.install Dir["*"]
    (bin/"closedloop").write_env_script libexec/"bin/closedloop.mjs",
      PATH:                       "#{Formula["node"].opt_bin}:$PATH",
      CLOSEDLOOP_HOMEBREW_PREFIX: HOMEBREW_PREFIX
  end

  service do
    run [opt_bin/"closedloop", "daemon"]
    environment_variables PATH: std_service_path_env
    # Restarts after a failure on launchd and systemd, not after a clean stop.
    keep_alive successful_exit: false
    throttle_interval 30
    restart_delay 30
    log_path var/"log/closedloop.log"
    error_log_path var/"log/closedloop.log"
  end

  def caveats
    <<~EOS
      Run this to sign in, record consent, and start the background service:
        closedloop setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/closedloop --version")
  end
end

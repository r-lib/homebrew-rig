cask "rig" do
  version "0.6.0"

  if Hardware::CPU.intel?
    sha256 "f1d0798ba15cb292886e5b93c7db463a196532f281824959408b53768b73c42a"
    url "https://github.com/r-lib/rig/releases/download/v#{version}/rig-#{version}-macOS-x86_64.pkg"
  else
    sha256 "0bbf457366f29fbe9a5daa5d465c33b71ff3a89879fd9946a1cf0ec9bc0b0208"
    url "https://github.com/r-lib/rig/releases/download/v#{version}/rig-#{version}-macOS-arm64.pkg"
  end

  name "r-lib/rig"
  desc "The R Installation Manager"
  homepage "https://github.com/r-lib/rig"

  depends_on macos: ">= :el_capitan"

  if Hardware::CPU.intel?
    pkg "rig-#{version}-macOS-x86_64.pkg"
  else
    pkg "rig-#{version}-macOS-arm64.pkg"
  end

  uninstall pkgutil: [
              "com.gaborcsardi.rig"
            ],

            delete:  [
              "/opt/homebrew/etc/bash_completion.d/rig.bash",
              "/usr/local/bin/rig",
              "/usr/local/share/zsh/site-functions/_rig"
            ]

  caveats do
    files_in_usr_local
  end
end

cask "rig" do
  version "0.7.0"

  if Hardware::CPU.intel?
    sha256 "a1164f63c7d6dc46b69bb99fbf52b8484c6a052a9b238061c7d9b84d9e991bec"
    url "https://github.com/r-lib/rig/releases/download/v#{version}/rig-#{version}-macOS-x86_64.pkg"
  else
    sha256 "b4cf03b483b6c16370aa85a13dbb4ab2b09b1d07f53a16a1a131f341ae2858ff"
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

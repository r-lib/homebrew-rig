cask "rig" do
  version "0.5.1"

  if Hardware::CPU.intel?
    sha256 "3f78ee0c4ed3e265dcc8d48aa96a7f7b4964f9b7f6c1d3e388955e7cf4f1a6cb"
    url "https://github.com/r-lib/rig/releases/download/v#{version}/rig-#{version}-macOS-x86_64.pkg"
  else
    sha256 "89067c19aee46af1d612014e6cca5997cdb6f07c4ce63190dd2259a16d6d0bf4"
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

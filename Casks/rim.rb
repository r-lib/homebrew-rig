cask "rim" do
  version "0.2.2"

  if Hardware::CPU.intel?
    sha256 "2e4c1d6b451e3d6551047230dc32f14d68e694b1fd545ac1f0cf3b637660eca4"
    url "https://github.com/gaborcsardi/rim/releases/download/v#{version}/rim-#{version}-macOS-x86_64.pkg"
  else
    sha256 "88dfc38f07078cfb46ae305b5a2dfa0ae723755dd3d715f7a1d4def7ab0f19a0"
    url "https://github.com/gaborcsardi/rim/releases/download/v#{version}/rim-#{version}-macOS-arm64.pkg"
  end

  name "gaborcsardi/rim"
  desc "The R Installation Manager"
  homepage "https://github.com/gaborcsardi/rim"

  depends_on macos: ">= :el_capitan"

  if Hardware::CPU.intel?
    pkg "rim-#{version}-macOS-x86_64.pkg"
  else
    pkg "rim-#{version}-macOS-arm64.pkg"
  end

  uninstall pkgutil: [
              "com.gaborcsardi.rim"
            ],

            delete:  [
              "/opt/homebrew/etc/bash_completion.d/rim.bash",
              "/usr/local/bin/rim",
              "/usr/local/share/zsh/site-functions/_rim"
            ]

  caveats do
    files_in_usr_local
  end
end

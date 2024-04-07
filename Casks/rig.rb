cask "rig" do
  version "0.7.0"

  if Hardware::CPU.intel?
    sha256 "420d14e9f2d80114de3ef8883d621372aee86fc2740ad654c8d3059196fc8194"
    url "https://github.com/r-lib/rig/releases/download/v#{version}/rig-#{version}-macOS-x86_64.pkg"
  else
    sha256 "51c0d528e8cd93e48f13eabe15ee878316f8f7faf1740d68084fcad330a49bcd"
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

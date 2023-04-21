cask "rig" do
  version "0.5.3"

  if Hardware::CPU.intel?
    sha256 "3ab2b8a997911761afe66870791d0ca489e3f9b47c9c7e1e8c65b1fd4fb60051"
    url "https://github.com/r-lib/rig/releases/download/v#{version}/rig-#{version}-macOS-x86_64.pkg"
  else
    sha256 "2ecd10de7a8f06ef5e7dc7dfc37fe8ccd6085f76e3257c59bcff234f85ebe8cc"
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

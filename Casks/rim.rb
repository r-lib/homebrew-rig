cask "rim" do
  version "0.3.0"

  if Hardware::CPU.intel?
    sha256 "ef2d070e34aca601bffa2b57549cd5499b47123ba8cf38d1caa8076a59d63524"
    url "https://github.com/gaborcsardi/rim/releases/download/v#{version}/rim-#{version}-macOS-x86_64.pkg"
  else
    sha256 "c548c289cb1407d02d6066b1fe7cc8e6667db5aa161cb7548388d4e225505afb"
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

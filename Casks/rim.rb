cask "rim" do
  version "0.2.3"

  if Hardware::CPU.intel?
    sha256 "de88717e634cdb76c460e90a944765c0032287f7f3cafd1a7cc84620b8f57a19"
    url "https://github.com/gaborcsardi/rim/releases/download/v#{version}/rim-#{version}-macOS-x86_64.pkg"
  else
    sha256 "ffbc9de9b76556d5a76854cd1b2a70b08b23dfb5a1b62b4dec0ca41f98e3b4b1"
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

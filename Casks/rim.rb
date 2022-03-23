cask "rim" do
  version "0.2.1"

  if Hardware::CPU.intel?
    sha256 "dc5a73b55c99abd890695d8e03fc4f2f089f8c7e971c29bc5b1a5cbacb7a21a7"
    url "https://github.com/gaborcsardi/rim/releases/download/v#{version}/rim-#{version}-macOS-x86_64.pkg"
  else
    sha256 "5c781d65a18fcfd687a815de7507f014cdf6c159a0c10fe44fe807a9286d236a"
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

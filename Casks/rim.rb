cask "rim" do
  version "0.2.0"

  if Hardware::CPU.intel?
    sha256 "a673fa6b4be75c1f991407a89aad62fbb1035567cb6f40974d771dd4c5f3ffb0"
    url "https://github.com/gaborcsardi/rim/releases/download/v#{version}/rim-#{version}-macOS-x86_64.pkg"
  else
    sha256 "8bd39681bd7fa2a0b519afabd1219d04eeff640837227b0f44c4fa067eb0e935"
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

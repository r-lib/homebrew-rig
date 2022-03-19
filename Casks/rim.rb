cask "rim" do
  version "0.2.0"
  sha256 "a673fa6b4be75c1f991407a89aad62fbb1035567cb6f40974d771dd4c5f3ffb0"

  url "https://github.com/gaborcsardi/rim/releases/download/v#{version}/rim-#{version}-macOS-x86_64.pkg"
  name "gaborcsardi/rim"
  desc "The R Installation Manager"
  homepage "https://github.com/gaborcsardi/rim"

  app ""
end

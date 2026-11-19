cask "deltavee" do
  version "0.1.0,1"
  sha256 "7e41078c7f6f8329d6beb0316843f6f97d190c67750f8bcde53251b1df70d2b0"

  url "https://github.com/pers0n4/deltavee/releases/download/v#{version.csv.first}/Deltavee-#{version.csv.first}-#{version.csv.second}.zip"
  name "Deltavee"
  desc "Menu bar monitor for Claude and Codex subscription usage"
  homepage "https://github.com/pers0n4/deltavee"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Deltavee.app"

  zap trash: "~/Library/Application Support/dev.pers0n4.deltavee"
end

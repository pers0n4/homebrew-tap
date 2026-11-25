cask "deltavee" do
  version "0.3.0,4"
  sha256 "cfa4a7e7990c8ed226b3b5be7ef6381273eb51fa4386285f670c5777c99a157e"

  url "https://github.com/pers0n4/deltavee/releases/download/v#{version.csv.first}/Deltavee-#{version.csv.first}-#{version.csv.second}.zip"
  name "Deltavee"
  desc "Menu bar monitor for Claude and Codex subscription usage"
  homepage "https://github.com/pers0n4/deltavee"

  livecheck do
    url :url
    regex(/^Deltavee-(\d+(?:\.\d+){2})-(\d+)\.zip$/i)
    strategy :github_latest do |release, regex|
      next if release["draft"] || release["prerelease"]

      release["assets"].filter_map do |asset|
        next if asset["state"] != "uploaded"

        match = asset["name"].match(regex)
        next if !match || release["tag_name"] != "v#{match[1]}"

        "#{match[1]},#{match[2]}"
      end
    end
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Deltavee.app"

  zap trash: "~/Library/Application Support/dev.pers0n4.deltavee"
end

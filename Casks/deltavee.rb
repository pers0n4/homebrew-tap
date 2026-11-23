cask "deltavee" do
  version "0.2.0,3"
  sha256 "3ed5302b4f4d09551cb66698ec3c0a7c836aafa0f96d76bf49aa08f65254deeb"

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

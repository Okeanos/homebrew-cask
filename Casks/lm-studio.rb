cask "lm-studio" do
  version "0.1.10"
  sha256 "df871083b4f6fb6ad8fa1d806ef44bb7e09b958c79bac3b497d7d123229ecd62"

  url "https://s3.amazonaws.com/releases.lmstudio.ai/#{version}/LM+Studio-darwin-arm64-#{version}.zip",
      verified: "s3.amazonaws.com/releases.lmstudio.ai/"
  name "LM Studio"
  desc "Discover, download, and run local LLMs"
  homepage "https://lmstudio.ai/"

  livecheck do
    url "https://s3.amazonaws.com/releases.lmstudio.ai/update.json"
    regex(/LM\+Studio[._-]darwin[._-]arm64[._-]v?(\d+(?:\.\d+)+)\.zip/i)
  end

  depends_on arch: :arm64

  app "LM Studio.app"

  uninstall quit: [
    "ai.elementlabs.lmstudio",
    "ai.elementlabs.lmstudio.helper",
  ]

  zap trash: [
    "~/Library/Application Support/LM Studio",
    "~/Library/Caches/ai.elementlabs.lmstudio",
    "~/Library/Caches/ai.elementlabs.lmstudio.ShipIt",
    "~/Library/HTTPStorages/ai.elementlabs.lmstudio",
    "~/Library/Logs/LM Studio",
    "~/Library/Preferences/ai.elementlabs.lmstudio.plist",
    "~/Library/Saved Application State/ai.elementlabs.lmstudio.savedState",
  ]
end

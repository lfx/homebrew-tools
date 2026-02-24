# Maintaining Formulas: Adding, Updating, and Validating

This guide provides instructions on how to add new tools to this Homebrew tap, update existing ones, and validate your changes before pushing them to GitHub.

## Adding a New Formula

All formulas in this tap live in the `Formula/` directory and are written in Ruby. 

1. Create a new file named `your-tool-name.rb` inside the `Formula/` directory.
2. Define the Formula class. The class name should be the PascalCase version of the file name (e.g., `mac-port-bar.rb` becomes `MacPortBar`).
3. Set up the basic metadata, download URLs, SHA256 checksums, and the installation logic.

Here is a standard template for a pre-compiled Go binary distributed across multiple macOS architectures:

```ruby
class YourToolName < Formula
  desc "A brief description of what your tool does"
  homepage "https://github.com/your-username/your-tool-name"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/your-username/your-tool-name/releases/download/v1.0.0/your-tool-name_Darwin_arm64.tar.gz"
      sha256 "REPLACE_WITH_ARM64_SHA256"
    end

    on_intel do
      url "https://github.com/your-username/your-tool-name/releases/download/v1.0.0/your-tool-name_Darwin_x86_64.tar.gz"
      sha256 "REPLACE_WITH_INTEL_SHA256"
    end
  end

  def install
    # This assumes the tarball contains a binary named exactly "your-tool-name"
    bin.install "your-tool-name"
  end

  # Optional: Include this if your tool runs continuously in the background
  service do
    run opt_bin/"your-tool-name"
    keep_alive true
    log_path var/"log/your-tool-name.log"
    error_log_path var/"log/your-tool-name.log"
  end

  test do
    # Basic test to ensure the binary was installed and is executable
    assert_path_exists bin/"your-tool-name"
    assert_predicate bin/"your-tool-name", :executable?
  end
end
```

## Updating an Existing Formula

When you release a new version of your tool on GitHub, you need to update its formula here so users can upgrade to it.

1. Open the tool's `.rb` file in the `Formula/` directory.
2. Update the `version` string to match the new release (e.g., `version "1.0.1"`).
3. Update the `url` strings if they contain the version number.
4. Replace the `sha256` checksums with the hashes of the new `.tar.gz` files.

### How to get the SHA256 Checksum

You can fetch the checksums directly from your release artifacts. If your release includes a `checksums.txt` file (like GoReleaser generates), you can simply view it:

```sh
curl -sL https://github.com/your-username/your-tool-name/releases/download/v1.0.1/checksums.txt
```

Alternatively, you can download the tarball and calculate the checksum locally:

```sh
curl -sL <TARBALL_URL> | shasum -a 256
```

## Validation and Testing

Before committing your changes, always validate that your formula meets Homebrew's strict styling rules and successfully installs.

### 1. Format and Style Validation
Run Homebrew's built-in Ruby linter (RuboCop under the hood) to catch syntax errors and styling issues:

```sh
brew style Formula/your-tool-name.rb
```

If it detects correctable offenses, you can automatically fix them using:

```sh
brew style --fix Formula/your-tool-name.rb
```

### 2. Audit the Formula
Check the formula for common mistakes, missing variables, or broken URLs:

```sh
brew audit --strict Formula/your-tool-name.rb
```
*(Note: If it complains about calling audit with a path instead of a name, you may need to commit your changes or test the audit directly from within your local tap directory at `/opt/homebrew/Library/Taps/...`)*

### 3. Test the Installation Locally
You can test the installation locally before pushing it by specifying the direct path to the `.rb` file. Note that depending on your Homebrew setup, you might need to test it directly from the Tap location.

```sh
brew install --build-from-source Formula/your-tool-name.rb
```

Once installed, run the formula's test block to ensure basic functionality:

```sh
brew test your-tool-name
```

## Publishing

Once your formula passes styling, auditing, and installs correctly:

1. Commit the changes to `main`:
   ```sh
   git add Formula/your-tool-name.rb
   git commit -m "Add/Update your-tool-name to v1.0.0"
   git push origin main
   ```
2. Users can now install or upgrade your tool using `brew update` followed by `brew upgrade your-tool-name`.
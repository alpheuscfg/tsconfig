set shell := ["bash", "-cu"]
set windows-shell := ["pwsh", "-Command"]

biome := "pnpm exec biome"

# Default action
_:
    just fmt
    just lint

# Install
i:
    pnpm install

# Lint code
lint:
    ls-lint -config ./.ls-lint.yaml
    typos

# Format code
fmt:
    {{biome}} check --write .

# Clean everything (Linux)
clean-all-linux:
    rm -rf ./node_modules

# Clean everything (macOS)
clean-all-macos:
    just clean-all-linux

# Clean everything (Windows)
clean-all-windows:
    Remove-Item -Recurse -Force ./node_modules

# Clean everything
clean-all:
    just clean-all-{{os()}}

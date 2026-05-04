# homebrew-tap

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Formula](https://img.shields.io/badge/Homebrew-tap-orange)](https://github.com/soapbucket/homebrew-tap)

Homebrew tap for [SBproxy](https://sbproxy.dev), the AI gateway built like a real proxy. Single binary, one YAML config, 103+ LLM providers.

## Install

```bash
brew tap soapbucket/tap
brew install sbproxy
```

## Upgrade

```bash
brew upgrade sbproxy
```

## Usage

```bash
sbproxy serve                    # start with default sb.yml
sbproxy serve -f /path/to/sb.yml # start with specific config
sbproxy validate                 # validate default config
sbproxy validate -f sb.yml       # validate specific config
sbproxy --version
```

## Links

- [Website](https://sbproxy.dev)
- [Documentation](https://sbproxy.dev/docs)
- [GitHub](https://github.com/soapbucket/sbproxy)
- [SBproxy Enterprise](https://sbproxy.dev/enterprise)

## License

Apache License 2.0. See [LICENSE](LICENSE) for details.

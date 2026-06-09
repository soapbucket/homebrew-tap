# homebrew-tap

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Formula](https://img.shields.io/badge/Homebrew-tap-orange)](https://github.com/soapbucket/homebrew-tap)

Homebrew tap for Soap Bucket's command-line tools.

```bash
brew tap soapbucket/tap
```

## Formulae

### mcptest

[mcptest](https://mcptest.sh) is an open source CLI for testing Model Context
Protocol (MCP) servers: service calls, the agent loop, schema drift,
compliance, and security, run in CI on every commit.

```bash
brew install soapbucket/tap/mcptest
brew upgrade mcptest

mcptest run --config tests/smoke.yml   # run a YAML test suite
mcptest --version
```

Links: [Website](https://mcptest.sh) ·
[Documentation](https://mcptest.sh/docs) ·
[GitHub](https://github.com/soapbucket/mcptest)

### sbproxy

[SBproxy](https://sbproxy.dev) is the AI gateway built like a real proxy.
Single binary, one YAML config, 103+ LLM providers.

```bash
brew install soapbucket/tap/sbproxy
brew upgrade sbproxy

sbproxy serve                    # start with default sb.yml
sbproxy serve -f /path/to/sb.yml # start with a specific config
sbproxy validate                 # validate default config
sbproxy --version
```

Links: [Website](https://sbproxy.dev) ·
[Documentation](https://sbproxy.dev/docs) ·
[GitHub](https://github.com/soapbucket/sbproxy) ·
[Enterprise](https://sbproxy.dev/enterprise)

## License

This tap's packaging is Apache-2.0 (see [LICENSE](LICENSE)). The installed
software is Apache-2.0 as well: both mcptest and sbproxy are Apache-2.0.

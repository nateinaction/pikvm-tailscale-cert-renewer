# PiKVM Tailscale Certificate Renewer

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
![Latest Release](https://img.shields.io/github/v/release/texas-state-space-lab/pikvm-tailscale-certificate-renewer)
[![Go Report Card](https://goreportcard.com/badge/github.com/texas-state-space-lab/pikvm-tailscale-certificate-renewer)](https://goreportcard.com/report/github.com/texas-state-space-lab/pikvm-tailscale-certificate-renewer)
![CI](https://github.com/texas-state-space-lab/pikvm-tailscale-certificate-renewer/actions/workflows/ci.yaml/badge.svg)

Automatically renew Tailscale SSL certificates for your PiKVM with ease!

## 🚀 Features

- **Automatic Discovery**: Detects your Tailscale domain without manual configuration
- **Certificate Management**: Creates and renews certificates seamlessly
- **NGINX Integration**: Updates NGINX configuration and restarts the service automatically
- **Zero Maintenance**: Set it and forget it - your certs will always be up-to-date

## 🛠 Prerequisites

This tool assumes you have:
1. Set up your PiKVM
2. Configured the [Tailscale integration](https://docs.pikvm.org/tailscale/) using the [official PiKVM documentation](https://docs.pikvm.org/)

## 📦 Installation

To install, run the following command on your PiKVM:

```bash
curl -L -s "https://raw.githubusercontent.com/texas-state-space-lab/pikvm-tailscale-certificate-renewer/main/install.sh" | bash
```

## 🔍 Monitoring 

After installation, the certificate renewer runs as a system service. You can monitor its status using systemctl:

```bash
systemctl status pikvm-tailscale-certificate-renewer
```

For more detailed logs, use journalctl:

```bash
journalctl -u pikvm-tailscale-certificate-renewer
```

## 🎬 Covered Scenarios

The certificate renewer primarily operates in an idle state but actively watches for the following scenarios:
- Tailscale domain changes
- Certificate mismatchs between Tailscale and filesystem caused by
    - Certificate revocation
    - Certificate expiry
    - Missing certificate files
    - Modified certificate files
- NGINX configuration changes

## 📋 Example Log
Here's an example log output when a Tailscale domain change occurs:

```
2024/07/17 04:25:31 WARN cert file does not exist path=/etc/kvmd/nginx/ssl/my-domain.mytailnet.ts.net.crt
2024/07/17 04:25:46 INFO filesystem mode changed to read/write
2024/07/17 04:25:46 INFO wrote cert file path=/etc/kvmd/nginx/ssl/my-domain.mytailnet.ts.net.crt
2024/07/17 04:25:46 INFO wrote key file path=/etc/kvmd/nginx/ssl/my-domain.mytailnet.ts.net.key
2024/07/17 04:25:46 INFO filesystem mode changed to read-only
2024/07/17 04:25:46 WARN cert or key line not found in nginx config path=/etc/kvmd/nginx/ssl.conf
2024/07/17 04:25:46 INFO filesystem mode changed to read/write
2024/07/17 04:25:46 INFO wrote to nginx ssl config path=/etc/kvmd/nginx/ssl.conf
2024/07/17 04:25:46 INFO filesystem mode changed to read-only
2024/07/17 04:25:48 INFO kvmd-nginx restarted
```

## 📝 License
This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 🌟 Show your support
Give a ⭐️ if this project helped you!

## 📞 Contact
If you have any questions or feedback, please [open an issue](https://github.com/texas-state-space-lab/pikvm-tailscale-certificate-renewer/issues) or start a [discussion](https://github.com/texas-state-space-lab/pikvm-tailscale-certificate-renewer/discussions).

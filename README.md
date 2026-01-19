# Simple iptables Firewall

A simple and beginner-friendly firewall script using **iptables**.  
This script blocks all traffic by default and allows only essential outbound connections.

It was created for learning purposes and to help people who have difficulties configuring a basic Linux firewall.


---


## 🔐 Features

- Default **DROP** policy (INPUT, OUTPUT, FORWARD)
- Stateful firewall using **conntrack**
- Allows essential outbound traffic:
  - SSH (22/TCP)
  - HTTP (80/TCP)
  - HTTPS (443/TCP)
  - DNS (53/TCP & UDP)
  - QUIC / HTTP3 (443/UDP)
- SSH inbound access **optional**
- Loopback traffic allowed
- Simple and readable configuration


---


## ⚙️ Requirements

- Linux
- `iptables` installed
- Root privileges

---

## 🚀 Usage

1. Clone the repository:
   ```bash
    git clone https://github.com/d4vidlinux/linux-firewall.git
    cd linux-firewall
    ```
2. Give execute permission:
    ```bash
    chmod +x fw_iptables.sh
    ```

3. Run as root:
    ```bash
    sudo ./fw_iptables.sh
    ```


---


## ⚠️ Warning

If you are connected via SSH, running this script may disconnect you

This firewall does not handle IPv6

This script is intended for learning and basic setups, not enterprise environments


---


## 💪 Persistence

This script applies firewall rules at runtime.

Firewall rule persistence is distribution-dependent and is NOT handled by this script.

Examples:

### Debian / Ubuntu
Use iptables-persistent to restore rules at boot.

### Arch Linux
Create a systemd service using iptables-restore.

### RHEL / CentOS
Use iptables-services.

Please refer to your distribution documentation for persistence.


---


## 💾 Saving Rules

The script saves the rules to a file > fw.rules







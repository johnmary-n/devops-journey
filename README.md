# Azure Cloud & DevOps Engineering Journey
### Module  Complete: Learned IP tracking and wrote a custom automated Bash deployment tool.
### Module  Complete: Mastered Git architecture, local staging states, and isolated branching mechanics.
## Phase : Cloud Infrastructure & Microsoft Azure Fundamentals
### Module  Complete: Analyzed IaaS vs PaaS vs SaaS models and mastered the Shared Responsibility Security matrix.
## Module complete: Cloud Infrastructure & Virtualization (Local UTM Pivot)

* **Objective:** Deploy a headless Linux Server and establish secure cryptographic access via SSH.
* **Engineering Pivot:** Encountered an automated portal restriction (`PurchaseNeedsReview`) on the cloud vendor's billing gate. To maintain project momentum, I engineered a local virtualization sandbox utilizing the UTM/QEMU framework natively on macOS architecture.
* **Network & Firewall Configuration:**
  * Topology: Isolated Emulated VLAN
  * Inbound Port Forwarding Rule: Host Port `2222` -> Guest Port `22` (SSH)
* **Execution Verification Log:**
  ```text
  $ ssh username@localhost -p 2222
  Welcome to Ubuntu 22.04 LTS (GNU/Linux ... aarch64)
  
  System information:
    System load:  0.0               Processes:             102
    Usage of /:   12.4% of 10.45GB  Users logged in:       1
  
  username@ubuntu:~$ uname -a
  Linux ubuntu 5.15.0-generic #ARM64 SMP Mon Jul 6 17:05:23 UTC 2026 aarch64 GNU/Linux
  username@ubuntu:~$ exit
  Connection to localhost closed.

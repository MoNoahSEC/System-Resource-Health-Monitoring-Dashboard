# 🛡️ NoahSysMon (System Resource & Health Monitoring Dashboard)

**Author:** Mohamed Abdelrazek (NOAH)

## Description
NoahSysMon is a real-time, terminal-based utility designed to track and display critical system metrics. It continuously monitors CPU, RAM, Disk usage, and Network interfaces. Additionally, it verifies the active status of essential system services (like SSH, Nginx, MySQL) and generates color-coded alerts to warn administrators before system failures occur. All data is logged and exported to CSV for data science analysis.

---

## Features
- **Live Dashboard:** Updates system metrics continuously.
- **Resource Tracking:** Calculates CPU, RAM, and Disk space accurately.
- **Service Health Checker:** Checks if critical backend services are running.
- **Color-Coded Alerts:** Green, Yellow, Red alerts based on thresholds.
- **Data Logging:** Saves plain-text logs to `sysmon.log`.
- **Data Export:** Exports metrics to `resource_history.csv` for analysis.

---

## Requirements
- Operating System: Linux (Ubuntu, Debian, CentOS, etc.)
- Standard Utilities: `bash`, `awk`, `free`, `top`, `df`, `ip`, `systemctl`

---

## How to Run
1. Open your terminal in the project directory.
2. Make the script executable:
   ```bash
   chmod +x run.sh

# 🛡️ NoahSysMon (System Resource & Health Monitoring Dashboard)
**نظام نوح لمراقبة الموارد وصحة النظام**

**Author / المطور:** Mohamed Abdelrazek (NOAH)

## Description | الوصف
**English:**
NoahSysMon is a real-time, terminal-based utility designed to track and display critical system metrics. It continuously monitors CPU, RAM, Disk usage, and Network interfaces. Additionally, it verifies the active status of essential system services (like SSH, Nginx, MySQL) and generates color-coded alerts to warn administrators before system failures occur. All data is logged and exported to CSV for data science analysis.

**عربي:**
نظام نوح (NoahSysMon) هو أداة تعمل في واجهة سطر الأوامر (Terminal) في الوقت الفعلي ومصممة لتتبع وعرض مقاييس النظام الحرجة. تقوم الأداة بمراقبة استهلاك المعالج (CPU)، الذاكرة (RAM)، مساحة القرص (Disk)، وشبكة الاتصال. بالإضافة إلى ذلك، تقوم بالتحقق من حالة تشغيل الخدمات الأساسية (مثل SSH و Nginx و MySQL) وتُصدر تنبيهات ملونة لتحذير مسؤولي النظام قبل حدوث أي أعطال. كما يتم تسجيل جميع البيانات وتصديرها لملف CSV لتسهيل تحليلها.

---

## Features | المميزات
- **Live Dashboard / لوحة معلومات حية:** Updates system metrics continuously (تحديث مستمر للبيانات).
- **Resource Tracking / تتبع الموارد:** Calculates CPU, RAM, and Disk space (حساب دقيق لموارد النظام).
- **Service Health Checker / فحص صحة الخدمات:** Checks if critical backend services are running (مراقبة الخدمات الأساسية).
- **Color-Coded Alerts / تنبيهات ملونة:** Green, Yellow, Red alerts based on thresholds (تنبيهات ملونة حسب حالة النظام).
- **Data Logging / تسجيل البيانات:** Saves plain-text logs to `sysmon.log` (حفظ السجلات في ملف).
- **Data Export / تصدير البيانات:** Exports metrics to `resource_history.csv` (تصدير البيانات بصيغة CSV للتحليل).

---

## Requirements | المتطلبات
- Operating System: Linux (Ubuntu, Debian, CentOS, etc.) / نظام لينكس
- Standard Utilities: `bash`, `awk`, `free`, `top`, `df`, `ip`, `systemctl` / أدوات النظام الأساسية

---

## How to Run | طريقة التشغيل
1. Open your terminal in the project directory / افتح موجه الأوامر في مسار المشروع.
2. Make the script executable / إعطاء صلاحيات التشغيل:
   ```bash
   chmod +x run.sh
   ```
3. Execute the script / تشغيل السكريبت:
   ```bash
   ./run.sh
   ```
4. Press `Ctrl + C` to stop safely / اضغط لإيقاف المراقبة.

---

## Outputs & Logs | المخرجات وملفات السجل
- **`sysmon.log`**: A continuous plain-text log of dashboard displays. / سجل نصي مستمر للوحة المعلومات.
- **`resource_history.csv`**: Saves timestamps with CPU, RAM, and Disk percentages. / ملف يحفظ الطوابع الزمنية مع نسب الاستهلاك.

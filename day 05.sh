
2️⃣ Install the required SELinux packages
sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils
Or, on dnf systems:
sudo dnf install -y selinux-policy selinux-policy-targeted policycoreutils
3️⃣ Permanently disable SELinux
Edit the configuration to ensure it’s disabled after the scheduled maintenance reboot:
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
4️⃣ Temporarily set SELinux to permissive mode
Since you don’t want to reboot immediately:
sudo setenforce 0
Verify the current mode:
getenforce
# Expected output: Permissive

clear
echo "Before installation, make sure you have a working internet connection. Depending on the quality of your computer and internet connection, installation may take around 15 minutes. Click any key to continue"
read input
sudo apt-get install git linux-headers-generic build-essential dkms
clear
git clone https://github.com/Mange/rtl8192eu-linux-driver
clear
cd rtl8192eu-linux-driver
sudo dkms add .
clear
sudo dkms install rtl8192eu/1.0
echo "blacklist rtl8xxxu" | sudo tee /etc/modprobe.d/rtl8xxxu.conf
clear
echo -e "8192eu\n\nloop" | sudo tee /etc/modules
clear
echo "options 8192eu rtw_power_mgnt=0 rtw_enusbss=0" | sudo tee /etc/modprobe.d/8192eu.conf
clear
sudo update-grub; sudo update-initramfs -u
clear
echo "A system reboot is required to make the driver work. Click any key to reboot."
read input
systemctl reboot -i
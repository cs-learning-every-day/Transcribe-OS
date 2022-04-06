 #!/bin/bash
usr=`whoami`
your_path="/home/$usr/tools" # 你也可以改路径
cd /home/$usr
! (test -d tools) && mkdir tools 
sudo apt-get -y install gcc
sudo apt-get -y install g++
sudo apt install -y make
sudo apt-get -y install build-essential
sudo apt-get -y install libgtk2.0-dev
sudo apt install -y libx11-dev
sudo apt-get -y install libxrandr-dev
sudo apt-get -y install gcc-multilib #后面编译32位程序用的

# https://deac-ams.dl.sourceforge.net/project/bochs/bochs/2.6.9/bochs-2.6.9.tar.gz #外网太慢
tar zxvf bochs-2.6.9.tar.gz -C $your_path/
cd $your_path/bochs-2.6.9/

#!/bin/bash

./configure \
--prefix=$your_path/bochs \
--enable-debugger \
--enable-disasm \
--enable-iodebug \
--enable-x86-debugger \
--with-x \
--with-x11 \
LDFLAGS='-pthread' \
LIBS='-lX11'	  

# 这是上面每条语句的意思
#用来指定bochs的安装目录，将your_path就是你的安装路径
#打开bochs 自己的调试器
 #使用bochs 支持反汇编
 # 启用io 接口调试器
 # 支持x86调试器	
 # 使用x Windows 
 # 使用xWindows
#这个是处理后面可能报的错误
#这个也是处理后面可能报的错误

make && make install

echo "#关键字为 megs
megs: 32

#设置对应真实机器的 BIOS 和 VGA BIOS 。
#对应两个关键字为 ： romimage 和 vgaromimage
romimage: file=$your_path/bochs/share/bochs/BIOS-bochs-latest
vgaromimage: file=$your_path/bochs/share/bochs/VGABIOS-lgpl-latest

#选择启动盘符
boot: disk  #从硬盘启动

# 设置日志文件的输入位置
log: $your_path/bochs.out

# 关闭鼠标，打开键盘
mouse: enabled=0
keyboard: keymap=$your_path/bochs/share/bochs/keymaps/x11-pc-us.map

# 设置硬盘
ata0: enabled=1,ioaddr1=0x1f0, ioaddr2=0x3f0, irq=14

# 启动盘信息   
ata0-master: type=disk, path=\"$your_path/bochs/bin/hd60M.img\", mode=flat" > $your_path/bochs/bin/bochsrc.disk

# !/bin/bash
path="$your_path/bochs/bin/"  #bin  # 大伙记得改下路径
cd $path
rm hd60M*  # 先删除，当然这条语句第一次肯定会执行失败，不过也不影响后面的创建
echo -e "1\nhd\nflat\n60\nhd60M.img"|./bximage  # 利用bximage 创建一个60M的硬盘


$your_path/bochs/bin/bochs -f bochsrc.disk
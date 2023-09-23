if [ -f "disk1.vhd" ]; then
    mv disk1.vhd disk1.img
fi

if [ ! -f "disk1.img" ]; then
    echo "error: no disk1.vhd, download it first!!!"
    exit -1
fi

if [ -f "disk2.vhd" ]; then
    mv disk2.vhd disk2.img
fi

if [ ! -f "disk2.img" ]; then
    echo "error: no disk2.vhd, download it first!!!"
    exit -1
fi

export DISK1_NAME=disk1.img

# 写boot区，定位到磁盘开头，写1个块：512字节
dd if=boot.bin of=$DISK1_NAME bs=512 conv=notrunc count=1

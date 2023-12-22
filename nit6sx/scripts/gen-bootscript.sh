#!/bin/sh
# Puts below info in a script and generate boot.scr
# This script assumes it's executed from 'artifact directory' (/scratch)

MMCBOOTDEV="${1:-0}"

echo "Using 'mmc dev $MMCBOOTDEV' as boot device."

cat << 'EOF' > bootscr.txt.in
# debos nit6sx boot script
# loadaddr=0x82000000
env exists ramdiskaddr || setenv ramdiskaddr 84000000
# fdt_addr=83000000
# console=ttymxc0
# baudrate=115200

setenv mmcbootdev '@MMCBOOTDEV@'

setenv prepbootargs 'if test -n "${console}"; then setenv bootargs "${bootargs} console=${console}" ; fi ; setenv bootargs ${bootargs} cma=256M ; setenv bootargs ${bootargs} root=LABEL=root'
#setenv bootargs  ${bootargs} quiet

setenv loadkernel 'load mmc ${mmcbootdev} ${loadaddr} /vmlinuz'
setenv loadfdt 'load mmc ${mmcbootdev} ${fdt_addr} /boot/dtb'
setenv loadrd 'load mmc ${mmcbootdev} ${ramdiskaddr} /initrd.img && setenv rdsize $filesize'
setenv loadall 'run loadkernel; run loadfdt; run loadrd'

setenv bootmmc 'mmc dev 0; run prepbootargs; run loadall; bootz ${loadaddr} ${ramdiskaddr}:${rdsize} ${fdt_addr}'

run bootmmc

EOF

sed -e "s/@MMCBOOTDEV@/$MMCBOOTDEV/" < bootscr.txt.in > bootscr.txt

mkimage -A arm -T script -C none -n "Debos Nitrogen6SoloX script" -d bootscr.txt $ROOTDIR/boot/boot.scr

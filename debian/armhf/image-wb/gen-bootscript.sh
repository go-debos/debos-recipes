#!/bin/sh
# Puts below info in a script and generate boot.scr
# This script assumes it's executed from 'artifact directory' (/scratch)

cat << 'EOF' > bootscr.txt
# debos wandboard boot script
# loadaddr=0x12000000
# ramdiskaddr=0x13000000
# fdt_addr=0x18000000
# console=ttymxc0,115200

setenv prepbootargs 'if test -n "${console}"; then setenv bootargs "${bootargs} console=${console}" ; fi ; setenv bootargs ${bootargs} cma=256M ; setenv bootargs ${bootargs} root=LABEL=root'
#setenv bootargs  ${bootargs} quiet

setenv loadkernel 'load mmc 0 ${loadaddr} /vmlinuz'
setenv loadfdt 'load mmc 0 ${fdt_addr} /boot/dtb'
setenv loadrd 'load mmc 0 ${ramdiskaddr} /initrd.img && setenv rdsize $filesize'
setenv loadall 'run loadkernel; run loadfdt; run loadrd'

setenv bootmmc 'mmc dev 0; run prepbootargs; run loadall; bootz ${loadaddr} ${ramdiskaddr}:${rdsize} ${fdt_addr}'

run bootmmc

EOF

mkimage -A arm -T script -C none -n "Debos Wandboard script" -d bootscr.txt $ROOTDIR/boot/boot.scr

del tw2cpc.dsk
del tw2.bin
del aytest.bin
del aytest2.bin

pasmo.exe 01_tw2cpc.asm tw2.bin
pasmo.exe aytest.asm aytest.bin
pasmo.exe aytest2.asm aytest2.bin
@pause


"zzz CPCDiskXP.exe" -File tw2.bin  -AddAmsdosHeader 0800 -AddToNewDsk tw2cpc.dsk
"zzz CPCDiskXP.exe" -File aytest.bin  -AddAmsdosHeader 6000 -AddToExistingDsk tw2cpc.dsk
"zzz CPCDiskXP.exe" -File aytest2.bin  -AddAmsdosHeader 1000 -AddToExistingDsk tw2cpc.dsk

copy /b tw2cpc.dsk "E:\emulators\cpc\roland-0.70-win32-Release\disks\tw2cpc.dsk"


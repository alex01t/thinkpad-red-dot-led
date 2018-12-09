# thinkpad-red-dot-led
Lenovo ThinkPad lid "i" red dot turn off/on
```
1. 
  enable write access
    sudo modprobe -r ec_sys
    sudo modprobe ec_sys write_support=1

2. 
  turn off:
    echo -ne "\x0a" | sudo dd of=/sys/kernel/debug/ec/ec0/io bs=1 seek=12 count=1 conv=notrunc
    
  turn on:
    echo -ne "\x8a" | sudo dd of=/sys/kernel/debug/ec/ec0/io bs=1 seek=12 count=1 conv=notrunc
    
  make it blink:
    echo -ne "\xca" | sudo dd of=/sys/kernel/debug/ec/ec0/io bs=1 seek=12 count=1 conv=notrunc

3. 
  if it doesn't work, try disable secure boot
```

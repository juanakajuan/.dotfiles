First, you'll need to identify your USB drive's device name. Be extremely careful with this step, as using the wrong device name could overwrite your system drive.

1. Before plugging in your USB drive, run:
```bash
lsblk
```

2. Then plug in your USB drive and run lsblk again to see which new device appeared. It might be something like /dev/sdb or /dev/sdc.
3. Once you're absolutely certain of the correct device, use dd like this:
```bash
sudo dd if=/path/to/your.iso of=/dev/sdX bs=4M status=progress
```

#### Replace:
- /path/to/your.iso with the actual path to your ISO file
- /dev/sdX with your USB drive's device name (NOT a partition number like sdX1)
- The status=progress flag shows you the copying progress
- bs=4M sets an optimal block size for faster copying

#### Important safety notes:
- Double-check the device name - using the wrong one can erase your hard drive
- Make sure your USB drive is unmounted but plugged in
- Don't unplug the USB drive until the process is complete
- This will erase everything on the USB drive

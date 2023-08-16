
## Overview

This Wireshark dissector can parse and show the keystrokes sent as part of the payloads of BadUSB devices/modules like Flipper Zero, Rubber Ducky, USBNinja and similar (as well as normal USB HID keyboard).


## Quickstart
1. Download and copy 'badusb_dissector.lua' to your Wireshark plugins folder (for example: on Windows on a default installation this will be at C:\Program Files\Wireshark\plugins)
2. Launch Wireshark and choose your USB capture device (For example USBPcap on Windows)
3. Start capturing USB traffic. If keystrokes were decoded successfully, they will show up in Wireshark like this:

![alt text](https://github.com/agentzex/FlipperZero-BadUSB-Wireshark/blob/main/screenshots/flipper_wireshark.JPG) 
<br/><br/><br/> 
##

![alt text](https://github.com/agentzex/FlipperZero-BadUSB-Wireshark/blob/main/screenshots/rubber_ducky_wireshark.JPG)


## Notes
- Currently tested on Flipper Zero BadUSB module with normal and Unleashed FWs, Rubber Ducky and USBNinja.
- Additional support for other modules/devices will be added in the future. This obviously depends on if I'll be able to get my hands on additional ones, and that's where you can help - Send me your devices! (:D not really but send me some PCAP captures of your BadUSBs payloads)
- If you're on Windows, make sure to install USBPcap (it's an optional driver installation as part of the normal Wireshark installation) before you start. This is necessary in order to capture USB traffic.
- If the USB keyboard packets captured on Wireshark don't show the keystorkes in the correct order they were sent by the payload, try the following:
    1. Remove the 'badusb_dissector.lua' file from your plugins folder
    2. Reopen Wireshark and capture the USB traffic you want
    3. When you're done, stop the capture and export it to a PCAP file from Wireshark (File -> Save As -> mycapture.pcap)
    4. Copy the 'badusb_dissector.lua' file to your plugins folder again
    5. Start Wireshark from your captured PCAP and check the dissected keyboard packets again

![alt text](https://github.com/agentzex/FlipperZero-BadUSB-Wireshark/blob/main/screenshots/capture_wireshark.JPG)


## Overview

This Wireshark dissector can parse and show the keystrokes sent as part of the payloads of BadUSB devices/modules like Flipper Zero, Rubber Ducky, USBNinja and similar (as well as normal USB HID keyboard).

The reconstructor can then take the dissected packets from Wireshark and reconstruct the original DuckyScript payload.


## Quickstart
1. Download and copy 'badusb_dissector.lua' to your Wireshark plugins folder (for example: on Windows on a default installation this will be at C:\Program Files\Wireshark\plugins)
2. Launch Wireshark and choose your USB capture device (For example USBPcap on Windows)
3. Start capturing USB traffic. If keystrokes were decoded successfully, they will show up in Wireshark like this:

![alt text](https://github.com/agentzex/FlipperZero-BadUSB-Wireshark/blob/main/screenshots/flipper_wireshark.JPG) 
<br/><br/><br/> 
##

![alt text](https://github.com/agentzex/FlipperZero-BadUSB-Wireshark/blob/main/screenshots/rubber_ducky_wireshark.JPG)


## Reconstructor
You can use reconstructor.py to try to reconstruct the original DuckyScript payload from the dissected packets which you captured in Wireshark (This result won't be identical but enough to get a sense of the original payload).

To do so:
1. Choose and export the dissected keyboard packets from Wireshark to JSON format (File -> Export Packet Dissections -> As JSON -> Save as 'packets.json' or similar)

![alt text](https://github.com/agentzex/FlipperZero-BadUSB-Wireshark/blob/main/screenshots/export_json_wireshark.png)

2. Copy packets.json file to the reconstructor folder
3. Run
   
       python reconstructor.py packets.json 
4. If it worked successfully, the reconstructed payload will be printed

*** There's an example in reconstructor folder for a simple DuckyScript rickroll payload. If you run the included packets.json file with reconstructor.py, the output should be similar to ducky_rickroll_youtube.txt  

![alt text](https://github.com/agentzex/FlipperZero-BadUSB-Wireshark/blob/main/screenshots/reconstructor.JPG)


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

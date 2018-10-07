# OpenTX Voices

Macintosh command line utility that generates a set of .WAV voice tracks for OpenTX. Usage:
```
opentx_voices.rb SSVFILE0 [SSVFILE1 ... [SSVFILEn]]
```

Pass the name of one or more semicolon separated value (SSV) voice files on the command line, and the utility generates a set of voice tracks under the `output/SOUNDS` directory. These voice tracks can be copied directly onto a Taranis' micro SD card.

An example of a SSV voice file is `english-taranis.csv` provided under the Taranis 2.1 voices [download directory](http://voices-21.open-tx.org/opentx-taranisplus/en/). It is included in this distribution for your convenience.


## Examples

_These examples assumes your are cd'ed into the `opentx_voices` directory._

###### Standard OpenTX voices ######
For version 2.1, use this command:
```
./opentx_voices.rb ver2.1/en-US-taranis.csv
```
For version 2.2, use a different voice file:
```
./opentx_voices.rb ver2.2/en-US-taranis.csv
```

###### Standard OpenTX plus Betaflight ######
For version 2.1, use this command:
```
./opentx_voices.rb ver2.1/en-US-taranis.csv betaflight.csv
```
For version 2.2:
```
./opentx_voices.rb ver2.2/en-US-taranis.csv betaflight.csv
```

###### Standard OpenTX plus iNav ######
There is now a small set of tracks for iNav

For version 2.1 of OpenTX, use this command:
```
./opentx_voices.rb ver2.1/en-US-taranis.csv inav.csv
```
For version 2.2 of OpenTx:
```
./opentx_voices.rb ver2.2/en-US-taranis.csv inav.csv
```

###### Standard OpenTX, plus Betaflight, plus iNav, plus your personal greeting ######
Included in this distribution is a sample greeting SSV file named `personal.csv.sample`. Make a copy of this file, name it `personal.csv`, and edit the content to reflect your name/handle/moniker instead of the first U.S. president. For OpenTX version 2.1:
```
./opentx_voices.rb ver2.1/en-US-taranis.csv betaflight.csv inav.csv personal.csv
```
For version 2.2:
```
./opentx_voices.rb ver2.2/en-US-taranis.csv betaflight.csv inav.csv personal.csv
```


## Mac OS X Voices

If you want to use a different voice to generate your sound tracks, follow these directions to change the default voice on your Macintosh - [https://www.google.com/search?q=mac+os+x+change+default+voice](https://www.google.com/search?q=mac+os+x+change+default+voice)

Here's a hint about removing voices from your Macintosh - [http://osxdaily.com/2011/07/29/delete-voices-mac-os-x-lion/](http://osxdaily.com/2011/07/29/delete-voices-mac-os-x-lion/)


## History

2018/10/07
: Added PID & rate profiles from 1 through 9

2018/09/22
: Added a few iNav tracks

2017/12/04
: Initial draft

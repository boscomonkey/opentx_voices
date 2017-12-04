# OpenTX Voices

Macintosh command line utility that generates a set of .WAV voice tracks for OpenTX. Usage:
```
opentx_voices.rb SSVFILE0 [SSVFILE1 ... [SSVFILEn]]
```

Pass the name of one or more semicolon separated value (SSV) voice files on the command line, and the utility generates a set of voice tracks under the `output/SOUNDS` directory. These voice tracks can be copied directly onto a Taranis' micro SD card.

An example of a SSV voice file is `english-taranis.csv` provided under the Taranis 2.1 voices [download directory](http://voices-21.open-tx.org/opentx-taranisplus/en/). It is included in this distribution for your convenience.


## Examples

_These examples assumes your are cd'ed into the `opentx_voices` directory._

###### OpenTX 2.1 voices ######
```
./opentx_voices.rb english-taranis.csv
```

######OpenTX 2.1 plus Betaflight
```
./opentx_voices.rb english-taranis.csv betaflight.csv
```

######OpenTX 2.1 plus Betaflight plus your personal greeting
Included in this distribution is a sample greeting SSV file named `personal.csv.sample`. Make a copy of this file, name it `personal.csv`, and edit the content to reflect your name/handle/moniker instead of the first U.S. president.
```
./opentx_voices.rb english-taranis.csv betaflight.csv personal.csv
```


## Changing Voices

If you want to use a different voice to generate your sound tracks, follow these [directions](https://www.google.com/search?q=mac+os+x+change+default+voice) to change the default voice on your Macintosh.

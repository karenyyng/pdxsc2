# pdxsc2

## Installing Python environment 
```bash
source ./config/conda_setup_script.sh
```

## Install StarCraft II game engine and download the maps
```bash
wget http://blzdistsc2-a.akamaihd.net/Linux/SC2.3.17.zip
mv SC2.3.17.zip $HOME 
unzip -p iagreetotheeula SC2.3.17.zip # this needs to be extracted to ~/StarCraftII
source ./config/prep_map.sh
```


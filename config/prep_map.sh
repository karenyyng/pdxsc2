mkdir -p $HOME/StarCraftII/Maps
cd ~/StarCraftII/Maps
echo 'Downloading maps'
if [[ ! -f Ladder2017Season1.zip ]]; then
  wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season1.zip
fi
if [[ ! -f Ladder2017Season2.zip ]]; then
  wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season2.zip
fi
if [[ ! -f Ladder2017Season3.zip ]]; then
  wget http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2017Season3.zip
fi
if [[ ! -f Melee.zip ]]; then
  wget http://blzdistsc2-a.akamaihd.net/MapPacks/Melee.zip
fi
echo 'Agree to the EULA'
unzip -P iagreetotheeula Ladder2017Season1.zip
unzip -P iagreetotheeula Ladder2017Season2.zip
unzip -P iagreetotheeula Ladder2017Season3.zip
unzip -P iagreetotheeula Melee.zip

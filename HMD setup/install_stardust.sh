#!/bin/bash

echo "make sure you have the dependencies installed first!"
mkdir stardust
cd stardust
git clone -b dev https://github.com/StardustXR/server.git
git clone -b dev https://github.com/StardustXR/flatland.git
git clone -b dev https://github.com/StardustXR/non-spatial-input.git
git clone -b dev https://github.com/StardustXR/protostar.git
cd server
cargo build --release || cargo build --release
cd ../flatland
cargo build --release
cd ../protostar
cargo build --release
cd ../non-spatial-input/simular
cargo build --release
cd ../manifold
cargo build --release
cd ../../
mkdir ~/.config/stardust
echo "#!/bin/bash" > ~/.config/stardust/startup
echo "xwayland-satellite :69 &" >> ~/.config/stardust/startup
echo "DISPLAY=:69 $(pwd)/stardust/protostar/target/release/hexagon_launcher & $(pwd)/stardust/flatland/target/release/flatland &" >> ~/.config/stardust/startup
chmod +x ~/.config/stardust/startup
echo "Assuming no error occured you should be good to go!"

# Quest3 Hacking Platform
I'll keep my notes, tips, and tricks for using the quest 3 as a component in a hacking platform here.  I'll also have some notes about hacking the quest 3.

# Quest 3 Hacking
## Privacy 
So its meta yeah? We don't trust them right? You do still need a meta account, and there are ADB commands I've found online that *might* disable telemetry on the device itself.  However since to my knowledge there is no way to root the Quest 3, these methods are of questionable effectiveness, and I think were patched out anyways. So how do you use this to hack in VR/AR without meta seeing everything you're doing and looking at through the headset? The answer is so simple it may surprise you!  

DNS Blocking. That's it, just block the domain names meta uses as telemtry servers and you're probably good. But I want to use my quest on other networks besides my own! I hear you say. You can use sidequest (https://sidequestvr.com) to side load a VPN application such as wireguard, openvpn, or tailscale that will VPN you back to your own home network. I personally use tailscale to create a mesh VPN network so that the majority of my internet traffic still flows normally, but the DNS lookups are targeted at my home DNS server, and I have the added benenfit of using the local connections just fine, including for Immersed.

## Using the Quest 3 as a standalone hacking device
Here we will be heavily relying on sideloading applications onto the headset. In order to do so you need to enable developer mode on the headset.
1. open the meta horizon app on your phone.
2. tap on the headset icon in the top left corner.
3. tap on the Headset Settings button.
4. tap on developer mode.
5. toggle the button to the on position.
6. you may need to reboot the headset for the change to apply.

Once developer mode is enabled you can use sidequest (https://sidequestvr.com) to sideload any android apks you want. 

### How to Side load
1. open sidequest
2. plug the headset into your computer via USB
3. on the headset you'll see a prompt to allow debugging access, accept it.
4. in the side quest app there's an icon in the top right that looks like a box with a downward facing arrow, click that.
5. select the APK you want to side load, and you're done!

### Apps you'll want to side load
- fdroid - FOSS android app repository
- aura store - google play store proxy

Once you get those side loaded we can use these app repos to install other apps we'll need.

### Recommended apps from fdroid
- termux
- termux
- fossify file manager
- any other fossify tools you want
- syncthing fork
- openvpn
- wg tunnel
- tailscale
- firefox/waterfox/librewolf

### recommended apps from aura store
- vivaldi browser
- tailscale (this is the stable version, the fdroid one gets updated more often, but also breaks more often)
- any other apps you want to install

the main crux of using the quest 3 as a standalone hacking device is termux. Termux gives you a linux command line experience, and by itself can do and install a ton of neat things, however if you want to use another linux distro for better tooling and what not you can use a proot environment. The full steps to setting up a Proot environment are out of scope for this repo, but there's a million guides out there.  Its the same process as on android phones. This setup does come with some downsides. Mainly that since we don't have root access we can't enable IP routing, or listen on ports below 1024. For everything else it works great!


If you're interested in using the Quest 3 as simply a HMD and use a laptop/desktop/steamdeck as the main computer that you're running attacks from, but have multiple virtual monitors set up there'll be a dedicated folder for that in this repo, check there for instructions! 


# Hacking on a Computer with VR screens
While getting a hacking environment setup on the quest 3 is super cool and useful, we ultimately can't get root on the device, which means we can't listen on ports below 1024, and we can't create raw sockets like what's needed for some portscans like UDP scans.

So then the best idea would be to hack on a Linux computer and use the Quest as an HMD right? That can't be that hard... right?

Its really not! I'm assuming your hacking machine will be Linux based here. (mainly because I don't actually own any windows computers so I can't write a guide for them ;-))

There are a couple of options, and both have their strengths and weaknesses.

## Immersed (virtual monitors)
there's an app on the quest store called immersed, they also have desktop clients available for Mac, Windows, and Linux.

https://www.immersed.com

this does actually work with wayland environments as well, though there are a couple of issues that they are still figuring out. The main one being that if you have a non-standard aspect ration (16:9 and 16:10 seem to work, but I have had issues with my 3440x1440 monitors as well as the built in framework screen) you can set the resolution of any monitor with your distros settings, just make sure they are a "standard aspect ratio". This problem does not exist if you're running an X11 session.

once you have the apps installed, and your account set up its as easy as launching the agent on your computer, for wayland it'll have you select all the currently connected monitors with the screenshare desktop portal, ignore when it tells you which monitor to select. the order doesn't matter too much, just make sure you select the one you want to be the "root" monitor first, then in what ever order you will remember after that. 

Then you can put on the quest and launch into the immersed application, it'll prompt you to connect to your pc, select the one you want and the monitors should show up, manipulating where the monitors are happens in the immersed quest app, and can be done with controllers or hand tracking.

### virtual monitors in immersed
But only having the physical monitors kinda defeats the purpose of using an HMD doesn't it? 

Yes, yes it does. so you can also create virtual monitors. There's a way to do this with x11 and xrandr, but I'm not super familiar with that. I'll leave you to google how to do that.

On Wayland, if you run plasma, the screensharing portal can create a new virtual monitor for you! The only downside is its hard coded to be 1920x1080@60hz. This is fine and will work perfectly for immersed, but it would be nice to manually set higher resolutions for more screen room.

In order to do this you'll need to set up the virtual monitors before launching. There's a dbus python script in the HMD setup folder in this repository, run that as many times as you want monitors, noting that immersed has a limit of 5 monitors it can display. then launch immersed like you would normally. 


## StardustXR
Being limited to just "monitors" seems like a limitation that shouldn't exist in VR/AR. I agree!

You can also set up a dedicated VR/AR/XR windowing environment! There's a few projects in this space, but I've had the most luck with StardustXR.

https://stardustxr.org

Stardust is an XR windowing server. It is built with 3d environments in mind, but you can also run it inside of a window on a flatscreen desktop as well for testing.

It does need an XR environment running to connect to. The main ones people use are Monado, SteamVR, and Wivrn (which in turn is based on Monado). 

I use Wivrn because passthrough works out of the box with it.

With Stardustxr you can place windows for applications anywhere in 3d space, making the entire world your monitor!

There is one big drawback to this solution though: mouse input is only handled via hand/controller tracking. This can be a pain to deal with if you need accurate mouse inputs. They are working on a solution to pipe mouse input into the 3d environment, but haven't done it yet. Its a small but passionate dev team, and their work is incredible so go support them! Write some code, donate, whatever its a GREAT team and a GREAT project!

### setup instructions:
install an XR environment on your computer, for this I'll be using Wivrn.

#### Wivrn setup
Wivrn has packages for distros as well as a flatpak. I've had no issues with the AUR version of Wivrn and the flatpak version so just install what you want.

Run through the standard setup process for Wivrn and install the Wivrn app from the metastore (alternatively you can side load it easily).

Once you have the headset talking to the XR server we can get started with the Stardust setup.

#### stardust setup
In order to get passthrough working properly we'll need the dev branches of the Stardust server as well as any clients we want to use.

In this example I'll be using the following packages for startust:
- server
- flatland
- protostar
- non-spatial-input

Server is pretty self explainatory, its the actual server that we will be running windows in.
I highly recommend creating a stardust folder somewhere on your system to keep things tidy, and work out of that for the following steps.

##### server install
you will need some software installed on your machine to get this building. Since we're using the dev branch we will need to compile it ourselves, but don't worry, rust and cargo makes this super easy!

first you'll need rust installed with a default toolchain.
If your distro has rustup in its repositories then install that with your package manager. other wise you can use this Bash one-liner to install rustup

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

once rustup is installed you'll want to install a toolchain, this is pretty easy, just make sure you're terminal is in your home directory and run.

`rustup install stable`

Then you'll need to install the following, it varies distro to distro so do this however works on your distro.
- cmake
- fontconfig
- EGL+GLES 3.2
- GLX+Xlib
- dlopen
- openXR-loader

Some of these may already be installed, so feel free to skip any you don't need. For example on my systems I've not had to manually install EG+GLES or GLX+Xlib.


once all that is installed and setup, move to that folder we created to keep things tidy and git clone the server repo's dev branch with

`git clone -b dev https://github.com/StardustXR/server.git`

Then we can compile it by cding into the server folder and running:

`cargo build --release`

This will take a bit as it downloads all the libraries and dependencies for the project. It may fail, but if you just re-run the command its always worked the 2nd time for me.

Next to make sure its working run the binary that was created in ./target/release/ with

`./target/release/stardust-xr-server`

this should open a window with a black screen. If it opens that window you're good to go!

go ahead and close that window and return to the terminal for the rest of the setup.

cd back to the base stardust folder you made to keep things tidy, now we'll clone the clients we want to use.  Run the following commands:

```sh
git clone -b dev https://github.com/StardustXR/flatland.git
git clone -b dev https://github.com/StardustXR/non-spatial-input.git
git clone -b dev https://github.com/StardustXR/protostar.git
```

Once we have all of these download we'll need to compile them.

```
cd flatland
cargo build --release
cd ../protostar
cargo build --release
```

these are the same procedure as the server, but non-spatial-inputs needs a bit of special sauce.  To compile what we need for that do the following:

```
cd non-spatial-input
cd simular
cargo build --release
cd ../manifold
cargo build --release
```

Now that we have everything compiled we'll want to make a stardust startup script that starts up all the things we'll need to run applications in stardustxr!

make a directory in your .config folder named stardust.

`mkdir ~/.config/stardust`

create and edit a new file in that folder called startup, use what ever text editor you want, but I'm a nano guy (yea crucify me later lol).

`nano ~/.config/stardust/startup`

past the following code into the editor and save:
```
#!/bin/bash  
  
xwayland-satellite :69 &  
DISPLAY=:69 /absolute/path/to/your/stardust_folder/protostar/target/release/hexagon_launcher & /absolute/path/to/your/stardust_folder/flatland/target/release/flatland &
```

Now when you launch the stardust server it'll automatically create a new satellite xwayland server and set it as the display (so we can run xorg applications within stardust).

Now just make sure the script is marked as executable:

`chmod +x ~/.config/stardust/startup`

#### launching stardust
now that everything is setup we can launch stardust!

first start up wivrn and connect to it with your headset. once you are connected you can run the stardust binary we configured

This will open the server and start hexagon launcher, and start flatland.

Back in the headset you should see a hexagon shaped icon. you can grab this icon with hand tracking or controllers, and move it where ever you want it. tap on it to open the launcher. This will expand to a hexagon grid of all your installed applications.

To launch an application you just grab one of the hexagon icons with either hand tracking or the grip button on the controller and drop it where you want the new window to open.

To resize or move the window there are handles on the bottom left and top right corners of the window, grab them with either hand tracking or controller grip buttons to resize/move the window.

Mouse input is handled via controllers or hand tracking.

But what about keyboards how do I get a keyboard in here!

For that we'll use a couple of the binaries we compiled earlier!

in a new terminal window cd into the non-spatial-input folder we cloned. run the following command:

`./target/release/manifold | ./target/release/simular`

this will open a black window on your flatscreen desktop. simply click inside of that window to capture your mouse and keyboard. Eventually this will work for mouse inputs as well, but that's yet to be implemented.

Now that input is captured the window you're currently looking at in stardust will get your keyboard input. Its honestly awesome, kinda like focus follows mouse, but instead its focus follows head!

I'll include a bash script that'll set all this up for you in the HMD Setup folder, so keep an eye out for that to make this easier!

I also plan to add screenshots, but with my track record that might take a while, sorry!

``
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

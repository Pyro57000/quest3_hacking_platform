# HMD Setup
For this you'll need some software, the main thing I use for this since I'm interfacing with linux PCs is Immersed (https://immersed.com). Immersed lets you mirror up to 5 (with pro mode) monitors in AR/VR space.
It can mirror any screens that the host machine can see, so physical or virtual. I'm a KDE Plama Wayland user so I utilize a small dbus python script that uses plasma's screenshare desktop portal to create a new virtual monitor that I can then
pass through to immersed.

For starters you'll need to install the immersed application from their website. There is an AUR package for it, or an appimage available on their website. You'll need to create a new immersed account as well.
Once that's all set up you'll need to install the immersed app rom the metastore on the quest 3 headset and follow the instructions to associate it with your immersed account.

NOTE: crash and usage logs are sent to immersed by default, but no visuals are sent to immersed unless you're in a public room and sharing your screen with another user. Their privacy policy is actually pretty reasonable.

I use this setup on my steamdeck, which I've setup to be a cyberdeck build. I use BazziteOS on the deck (https://bazzite.gg) it gives a very similar experience to stock SteamOS except its based on fedora silverblue so you can use rpm-ostree
to modify the image used for the root, allowing you to do things that persist OS updates.  Bazzite also ships Plasma6 and uses wayland for desktop mode, SteamOS is still on plasma 5.27 and X11 for thier desktop mode.

Generally my flow to get fully setup is
1. start immersed and share the builtin screen
2. use the dbus python script to create 2 virtual monitors
3. in immersed I click on menu (sometimes the click is glitched and you need to click on other buttons to fix it)
4. in the menu I select reset wayland screens
5. I follow the onscreen prompts to share all three screens (the built in one and the two virtual screens)
6. I open the immersed app in my headset and use KDE's built in display settings to arrange them how I want, and physically move the screens in immersed to match.

Now you have a multimonitor setup in VR/AR space!  There are some caveats to this setup however.

1. At this point in time there is a bug in immersed, if you use certain Aspect ratios on the screens in plasma wayland they become garbled and unreadable in immersed. So far 16:9 and 16:10 seem to work well, but my 21:9 ultrawides do not.
2. on windows and mac immersed has monitor controls that you can adjust from within the app itself, but that is not available on linux
3. by default immersed works over a local wifi connection to stream wirelessly, but also has an experimental wired mode that might reduce latency.
4. encode, network, and deocde latency can vary wildly, especially when more then 1 screen is shared from a device like the steamdeck. I wouldn't recommmend streaming multimonitor for gaming.

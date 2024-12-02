## Basic Info
Hey! Welcome to my guide on my Linux setup I have used every day for over 6 months. This should provide everything you need to get a fully working setup! I personally use Fedora because it has been reliable, works especially well with ThinkPads (I have an X1 Carbon Gen 9 in case you are curious). Also I wanted to try something different since I have been using Debian-based Distros for a while. 

One thing to note if you decide to follow along is that some things may not work exactly with other Distros or computers. However, if something doesn't end up working properly, there is likely to be a guide online. 

To summarize what the guide will cover is the following. Using fedora as the Operating System, we will install the i3 window manager. i3 is like GNOME in that the user (us) interacts with, and manages the screen. Like moving windows around, full-screening, minimizing tabs, and navigating the UI. To add a custom bar at the bottom of the screen like the Windows Task bar, we will use a program called Polybar, which is very customization and clean. To select apps we want to load (similar to the start menu) we will use a program called Rofi. It is also very customizable, and looks good. Since i3 doesn't work out of the box too well with external monitors, we will use xrandr, which gives us fine tuning of how we want our monitors to work. I hope you are able to follow along, and that everything will work the way you want!

Things covered: Fedora, GNOME, i3, Polybar, Rofi, Feh, Xrandr


## Firefox
I personally use Firefox as it provides great security, and works for what I need it to do. Here is what I do to make Firefox even better. 
##### Home Screen
Disable Shortcuts and Recommended Stories 
Change New Window and Tab Page - Settings > Home: Set Homepage and new windows to Firefox Home
##### Settings
Strict Browser Privacy - Settings > Privacy & Security > Browser Privacy > Strict
Disable "Ask to save passwords" - Settings > Privacy & Security > Passwords > Ask to save passwords
Disable Autofill > Settings > Privacy & Security > Autofill: Uncheck Save and fill addresses & Save and fill payment methods
Disable Data Collection (the following) - Settings > Privacy & Security > Firefox Data Collection and Use > Allow Firefox to send technical and interaction data to Mozilla
##### Themes and Extensions
Dark Space Theme - [Theme](https://addons.mozilla.org/en-US/firefox/addon/nicothin-space/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
uBlock Origin - [Extension](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
Dark Reader - [Extension](https://addons.mozilla.org/en-US/firefox/addon/darkreader/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
##### Extra
Compact Mode (Shortened height of Tabs)
- Type about:config into address bar
- Click Okay
- Search *browser.compactmode.show* and set it to True
- Click the Hamburger Icon > More Tools > Customize toolbar... > Density (Bottom of screen) > Compact
- Click Done
Only show Bookmark bar on New Tab
- Right Click Bookmark Bar > Bookmark Tools: Only Show on New Tab


### GNOME Settings
GNOME is a great Desktop Environment (FACT CHECK) as it looks good, works well, and is easy to use. If you just want to use GNOME, but still want a better experience, there are a couple things that might make your experience better. All the following are in the GNOME Settings Application. 

Appearance
	- Set Style to Dark 
	- Change wallpaper if wanted
Multitasking
	- Disable Hot Corner
Power
	- Enable Show Battery Percentage
Display
	- If the screen is too small, consider enabling Fractional Scaling
	- Allows for 100%, 125%, 150%, etc... display scaling
	- \*** May cause blurry text, or other issues ***
	- In your terminal, enter the following
	- ```gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"``` 
	- Restart device
	- Go back into Settings > Display > Built-in display: Set custom scale percentage
Mouse and Trackpad
	- In Touchpad (Icon at top of screen) Enable Tap to Click
Users
	- Enter your Credentials to Unlock
	- Change your Profile Picture if wanted
	- Enable Fingerprint Login if available


## Extra Settings
Here are some extra things to add. They are not essential or groundbreaking, but a nice addition. 
##### Enable Minimize Button 
Type the following into your terminal ```gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,close'```
##### Custom Fonts
- Go to this [GitHub](https://github.com/IdreesInc/Monocraft) for the Monocraft font, or wherever your font of choice is listed
- For this specific font, download the latest Monocraft.ttf (nerd-fonts-patched) [here](https://github.com/IdreesInc/Monocraft/releases/download/v3.0/Monocraft-nerd-fonts-patched.ttf)
- Make a fonts directory ```mkdir ~/.local/share/fonts``` 
- Move the file into the newly created directory ```mv ~/Downloads/Monocraft-nerd-fonts-patched.ttf ~/.local/share/fonts/``` 
- Run the following command ```fc-cache -fv```
- You may need to log out or restart your device
##### Change Default Terminal Look
- Open Terminal > Click the Hamburger Icon > Preferences
- Click the + next to Profiles and set a name
- Change the Text Size to what you want
- Enable Custom font (set to Monocraft)
- Change the Colors to what you want


## Installing Apps
Sometimes dnf doesn't have all the apps needed, so I use flatpak. Searching if an app is available with flatpak, use the following command:

```
flatpak search name
```

Once you find the right application, you can install it with 

```
flatpak install ApplicationID
```

Another great place for finding apps is the built in Software Store. 


## i3 Installation
Description about i3 and stuff
What is a window manager vs desktop manager I think...
We will cover much more about i3 later, but for now we just need to get it working and set some things up
##### Install i3 and More

i3 Packages

```
sudo dnf install i3 i3status dmenu i3lock xbacklight feh conky 
```

Other Packages 

```
sudo dnf install polybar rofi xrandr arandr dunst brightnessctl
```


## Getting Started with i3
To use i3, you will need to log out of GNOME. Once you do, click your computer name, then look in the bottom right corner for a settings icon. Click that and select *i3*. Log in with your credentials, and you will be greeted with Super Key configuration. I use the defaults, so click enter both times. 

Right off the bat, you are probably thinking, "*what is this...*" One thing to know about i3 is that it takes quite a bit of initial customization, but ultimately gives you so much freedom. Throughout this guide, you will come to realize the power of i3.

##### Initial Configuration
i3 isn't configured the best right after an install. There are a couple things to change to make it a more usable experience. The following will be covered below. 
##### Scaling
You probably notice that the scaling is very small depending on your screen resolution. With i3, you will need to change the global scaling. 

1) First, create an Xresources file to adjust the DPI based on your screen ```vim ~/.Xresources``` or replace vim with your favorite text editor (e.g. nano)
- If you use vim, you may need to install it. You can do so with ```sudo dnf install vim```

	##### **Basics of Vim** 
	Edit a file with vim - ```vim file```
	To type in the file - Press the *i* key. It will enter the *Insert Mode* allowing for editing files
	Exiting vim:
	- Press ***ESC*** - It exits *Insert Mode*
	- Type ***Colon Key** " **:** "* - Enters command mode, where you can type in commands
	- Type ***wq*** - w stands for write, q stands for quit
	- Press ***Enter***
	There you go, it's not *that* hard...

##### Xresources
Create an .Xresources file ```vim ~/.Xresources``` (or whatever text editor you use)
Add the following to the blank file:

```
Xft.dpi: 120
``` 

If you have a larger screen, you may want to experiment with that value. It doesn't have to be 120, that is what happens to look best with my screen. I would recommend changing it to what looks best for you. *Note, you will need to log out and back in to see changes.* 

In your terminal type 

```
xrdb -merge ~/.Xresources
``` 

Then 

```
exec i3
```

Log out and back in to see changes.

If you have a 4K or High DPI screen, reference the [[#4K or High DPI]] section before continuing.

##### Enable Normal (Natural) Scrolling
By default, i3 has the reverse scroll that most people would not prefer. To change that as well as enabling tap to click and three finger click to middle mouse button, add the following to the configuration file listed below

Use your favorite text editor to modify the following

```
sudo vim /usr/share/X11/xorg.conf.d/40-libinput.conf
```

Find the section that looks like this:

```shell
Section "InputClass"
        Identifier "libinput touchpad catchall"
```

Add this under the section

```shell
Option "NaturalScrolling" "True" # Enables Normal Scrolling
Option "Tapping" "on" # Enables Tap to Click
Option "TappingButtonMap" "lrm" # Three Finger Click -> Middle Mouse Button
``` 

It should end up looking like:

```shell
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
```

You may need to log out and back in...


## i3
i3 is a window manager as opposed to a desktop environment. A window manager allow for more efficient placement and movement of windows on a screen. It usually is a more basic layout, and can be customized to how you want. 

Basics
Super Key is the Windows Key in this configuration

   Open Terminal - Super + Enter 
   Open an application - Super + d (dmenu) then type name
   Switch Virtual Desktops - Super + Number 
   Move Window to Virtual Desktop - Super + Shift + Number
   Close Window - Super + Shift + Q
   Resize Window - Super + Shift + R  (Resize with Arrow Keys, Esc to exit resize mode)
   Log Out - Super + Shift + E
   Lock Screen - Fn + 4

Other Things to Note, until you figure out how to use a GUI you will be stuck with Command line. You will have to find ways around certain things. However most of the core functionality fairly easy to work with. There are some bugs that you will notice though.

For example, to change the brightness, you will need to install brightnessctl with  ```sudo dnf install brightnessctl```
Then use the command ```brightnessctl set number%``` to change the brightness
You can set an alias to shorten ```brightnessctl set``` to ```bright``` or even ```b``` if you want. 

There are other shortcomings of i3, most of which can be overcome. 


## Aliases
As stated earlier, aliases creates a command to represent a command
You can find the alias file (.bash_aliases) in the repository. 

To permanently save aliases so you can use them after reboot, see the below
 Steps

Edit the ```/.bashrc``` file adding the following 

```shell
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
```

Then create your ```.bash_aliases``` file using ```vim ~/.bash_aliases``` adding your aliases in the file. I would recommend using mine. Save and exit the file.

Then to make the aliases work and keep them after a reboot enter the following command.

```shell
source ~/.bashrc
```

You will need to run that every time you add an alias. However, I made an alias for that command, so all you have to do is ```alias-save``` to save your aliases. You will still need to enter the ```source ~/.bashrc``` for the first time.

##### Example Aliases
I figured it might be cool to explain some of the aliases I have. 

Starting off with ```wallpaper``` and ```poly```. Since I don't have the wallpaper and poly to start automatically, I made an alias so I don't have to type the entire command to start both, I just have to type ```wallpaper``` and ```poly``` into the terminal to start them. I don't have them start up automatically because at least with feh, xrandr can mess up the wallpaper once you add a monitor. So I would have to redo the wallpaper command anyways. Not a big deal for me.

The ```monitor-on``` and ```monitor-off``` commands allows me to quickly connect and disconnect my monitor to my computer. It allows for easy switching back and forth/

The ```battery``` and ```capacity``` commands are shortcuts to show me more information about the battery life, health, and capacity. Useful especially if you want to know how much your battery capacity it has lost over it's lifespan.

The ```alias-list```, ```alias-edit```, ```alias-save``` commands allow me to show all alias commands created, edit the ```.bash_aliases``` file, and save the aliases so they can be used after a reboot. 


## Wallpaper
The default wallpaper for i3 is not the prettiest...

You can use the ```feh``` command to set a wallpaper
Set the wallpaper as a specific image with ```feh --bg-fill ~/Path/to/image.png```


## Rofi
[GitHub](https://github.com/davatorium/rofi)
Dmenu or MOD + D is nice, but unfortunately has some limitations. It also doesn't like anything special. That is where Rofi comes in. Rofi is an "application launcher and dmenu replacement". 

We installed rofi earlier, but can install it with ```sudo dnf install rofi```

I would recommend reading the documentation to get a better understanding, but rofi looks for a configuration file, or a .rasi file in the ~.config/rofi directory. My configuration file is listed in the repository to reference. It is based on one of the themes provided in the GitHub

Setup (Pulled from [GitHub](https://github.com/davatorium/rofi?tab=readme-ov-file#quickstart))

To run rofi to search for an application

```shell
rofi -show drun
```

Generate a Default configuration file

```shell
mkdir -p ~/.config/rofi
rofi -dump-config > ~/.config/rofi/config.rasi
```

To use Rofi with i3, you will need to add a custom shortcut in the ```.config/i3/config``` file. You can also change the P to whatever letter you want, as long as it isn't already.
```shell
# Rofi Super + P
bindsym $mod+p exec --no-startup-id rofi -show drun
```


## Polybar
Description of polybar

We installed polybar earlier, but you can install it with ```sudo dnf install polybar```

I would recommend looking at the [GitHub](https://github.com/polybar/polybar) and the [Wiki](https://github.com/polybar/polybar/wiki)

Polybar is similar to rofi in that it looks for configuration file in the .config/config.ini. Like for Rofi, I included my polybar configuration file in the repository.

Setup (also in GitHub)
The default config which is a basic template is stored in ```/etc/polybar/config.ini```
Polybar looks for the config file in ```~/.config/polybar/config.ini```
Make a polybar directory in the .config directory ```mkdir ~/.config/polybar```
Copy the default config to the .config/polybar
To name a bar, look for ```[bar/here-is-the-name]```

```ini
[bar/change-this]
width = value
height = value
radius = value
```

You can run ```polybar name-of-bar``` to see what it looks like

To keep polybar visible the entire time, create a ```launch.sh``` file in the ```~/.config/polybar/``` directory with the following. Mine can be found in the repository.

```shell
#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar your-bars-name 2>&1 | tee -a /tmp/polybar1.log & disown


echo "Bars launched..."

exec_always --no-startup-id $HOME/.config/polybar/launch.sh
```

Make sure to rename your-bars-name to the name of your bar 

Make the ```launch.sh``` file executable:

```shell
chmod +x $HOME/.config/polybar/launch.sh
```

Remove (or comment out) the following in the ```.config/i3/config``` file. The line is located at the very bottom.

```shell
bar {
    i3bar_command i3bar
}
```

To make polybar behave properly with i3, add the following lines to your polybar config.rasi file.

```ini
[bar/your-bars-name]
override-redirect = false
wm-restack = i3
```

Great! Everything should be set up now. Instead of using ```Windows + D``` to search for an application, use ```Windows + P``` or whatever you set your command to if you changed it. 


## Xrandr (use Arandr for a GUI)
[Arch Wiki](https://wiki.archlinux.org/title/xrandr)
Monitor support is not the easiest to work with i3, however that is where xrandr comes in. More about xrandr... I would definitely take a look at the Arch Wiki document to understand it better. 

Use ```xrandr``` to see details about your displays.

Plug in a monitor to your device and run ```xrandr``` again to see it update with information about your monitor

Your built in display is most likely listed as ```eDP-1```

Add second monitor to the right of your built in display - ```xrandr --output HDMI-1 --auto --right of eDP-1``` Switch HDMI-1 to what your monitor displays as with ```xrandr```

To disconnect the monitor from i3, use ```xrandr --output HDMI-1 --off```

Tag Option Examples
```
--mode 1920x1080
--rate 60
--scale 1.25x1.25
--right-of eDP-1
--left-of 
--above
```

I created a couple aliases to quickly connect and disconnect my monitor when its on the go.

**Important**: If you want a solid GUI option replacement for Xrandr, use Arandr.

``` bash
sudo dnf install arandr
arandr
```

## i3 Configurations
The stock i3 Configuration gives you most of everything you will need to navigate. There are a few things that I have personally added to make the experience more powerful. 

##### More Workspaces
With the default configuration, you only have 10 workspaces you can use. If you have a second monitor, it could be useful to have more than 10. It also allows you to keep a scheme like: Main Monitor workspaces 1-10, Second Monitor workspaces 11-20.

Add the following to your ```~/.config/i3/config``` file

```
set $ws11 "11"
set $ws12 "12"
set $ws13 "13"
set $ws14 "14"
set $ws15 "15"
set $ws16 "16"
set $ws17 "17"
set $ws18 "18"
set $ws19 "19"
set $ws20 "20"

bindsym $mod+$alt+1 workspace number $ws11
bindsym $mod+$alt+2 workspace number $ws12
bindsym $mod+$alt+3 workspace number $ws13
bindsym $mod+$alt+4 workspace number $ws14
bindsym $mod+$alt+5 workspace number $ws15
bindsym $mod+$alt+6 workspace number $ws16
bindsym $mod+$alt+7 workspace number $ws17
bindsym $mod+$alt+8 workspace number $ws18
bindsym $mod+$alt+9 workspace number $ws19
bindsym $mod+$alt+0 workspace number $ws20

bindsym $mod+Shift+$alt+1 move container to workspace number $ws11
bindsym $mod+Shift+$alt+2 move container to workspace number $ws12
bindsym $mod+Shift+$alt+3 move container to workspace number $ws13
bindsym $mod+Shift+$alt+4 move container to workspace number $ws14
bindsym $mod+Shift+$alt+5 move container to workspace number $ws15
bindsym $mod+Shift+$alt+6 move container to workspace number $ws16
bindsym $mod+Shift+$alt+7 move container to workspace number $ws17
bindsym $mod+Shift+$alt+8 move container to workspace number $ws18
bindsym $mod+Shift+$alt+9 move container to workspace number $ws19
bindsym $mod+Shift+$alt+0 move container to workspace number $ws20
```

Also under ```set $mod Mod1``` (located near the top), add ```set $alt Mod1``` so you can use Alt for shortcut.

You may need to log out and back in again. Now you can access Workspaces 11-20 with just adding ```Alt``` to your shortcut keys. If you want to go to workspace 14, use ```Super + 4```, if you want to go to workspace 14, use ```Super + Alt + 4``` The same applies for moving a window to a workspace, use ```Super + Shift + Alt + 4```

Refresh with ```Super + Shift + R``` or log out and back in
##### Colors
The color scheme for i3 is also not the prettiest. You can set custom colors for the borders, fonts, and more. You can use my colors below. It is a darker, minimal color scheme. Feel free to customize.

```
# class                 border  backgr. text    indicator child_border
client.focused          #3a3a3a #3a3a3a #ffffff #3a3a3a   #3a3a3a
client.focused_inactive #333333 #5f676a #ffffff #484e50   #5f676a
client.unfocused        #333333 #222222 #888888 #292d2e   #222222
client.urgent           #2f343a #900000 #ffffff #900000   #900000
client.placeholder      #000000 #0c0c0c #ffffff #000000   #0c0c0c

client.background       #ffffff
```

Refresh with ```Super + Shift + R``` or log out and back in
##### Remove Window Text
Polybar automatically shows the window name details right next to the workspaces numbers
Personally I also like more vertical room, and since it's already listed at the bottom, I would like to remove it. You can do so by adding the below to the ```~/.config/i3/config``` file.

```
# Remove Top Border Title
default_border pixel 2
default_floating_border pixel 2
```

Refresh with ```Super + Shift + R``` or log out and back in
##### Custom Scripts
Lets say you have a script or command you want to create a shortcut for. You would do the following.

```
# Custom
bindsym $mod+key+combination exec "sh /Path/to/script.sh"
bindsym $mod+key+combination exec "command"
```

## 4K or High DPI 
If you have a High DPI screen, everything at first will look extremely small. Everything we cover can be customized to work with your screen. 

It does require just a small amount of extra configuration, but is worth it. Let's take the [[#Xresources]] setup as an example; you would need to change the dpi number from 120 to something much higher. You could change it to 200 or so. Experiment and see what looks and works best for you. That is the beauty of i3, you can customize it to how you want it. 

For Polybar and Rofi, you would need to look that up. I believe it is very simple like adding ```something dpi number``` to each configuration file. It is not exactly as simple as that, but close. I have made sure everything scales properly after configuring, but it has been a while. 


## Issues
i3 is not perfect. Some things will break, and you have to figure them out. Some of the things that have broken for me will be listed below. There are likely ways to fix them, however I haven't put in the time to research all of them.

**Dark Mode Broken** - When using i3, apps will switch to light mode, even with GNOME Settings set to Dark. To fix, set individual apps to dark mode specifically. For the ones that don't have that option, I am not sure... I haven't looked into it too much, but there is likely something online on how to fix. 
**Screen Tearing** - When scrolling, you will likely notice screen tearing. Using Brave eliminates some screen tearing. There is a decent amount of talk online around this issue. I haven't done much research on it since it isn't terrible.
**Authentication Full-screen Popup** - Sometimes when apps need authentication for what you are doing, an authentication popup will display on GNOME. However, it doesn't show on i3. I have not looked into this at all, but there may be something online on how to fix it. It hasn't been too big of an issue because few apps use that kind of authentication. And if it is, I just switch to GNOME for that specific task.
**Video Playback** - Occasionally certain videos on websites will say that there is an error and cannot be played. I am not sure how to fix this, but it hasn't been too big of an issue because the videos I do need to see, generally work properly. It could be a Firefox issue, using Brave should fix most issues.
**Unlocking Screen Delay** - If you set up a fingerprint, and you go to log in after locking your screen, you may notice that the *Verifying...* message hangs for 10ish seconds. That is because it is waiting for a fingerprint (even though fingerprint doesn't work with i3lock). To solve this issue, you can either remove your fingerprint, or while it says *Verifying...* put your finger on the fingerprint reader and it will not hang for nearly as long. That way, you don't have to remove your fingerprint.
**Others** - Theses were just the main bugs I have run into. There may be other issues with different computers or OS's if you're not using Fedora. These same issues may also be fixed on other OS's too. Incase you are wondering, I am using a ThinkPad.

## Other Considerations
You will likely experience other issues while using i3. That is the nature of it. You just have to work through them. It may get frustrating at times, but is so worth it especially after you fix the issues. If you have something specific that is not working, there is more than likely someone else who has had the same issue. It is a lot more likely that you are doing something wrong, than the program is... Check online to see what other people have said concerning the issue. I use Google as it has superior searching, especially for random bugs and problems. Reddit, Stack Overflow, Wikis, and even GitHub (for their problem trackers) are great resources. Learning how to use Google effectively is a great skill to have. It will not only help you find issues and problem solve, but will make you more effective in everything you do! I hope you were able to follow along and enjoy this guide! If you got this far, thank you so much! Enjoy your new setup!!!


## Install My Setup
I have uploaded my entire setup covered in this guide. Thankfully, it should be as simple as below to install.

Open your terminal and type the following if you don't have git installed:

``` bash
sudo dnf install git
```

Once finished or if you already have git, clone my repository with the following:

``` bash
cd ~ # Download it to your home directory for the script to work
git clone https://github.com/grpchatdstryr/Linux-Setup.git
```

Make the script executable: 

``` bash
cd Linux-Setup
chmod +x setup.sh
```

Run the script!

``` bash
./setup.sh
```

Hopefully everything works properly! If so, head down to my Shortcuts Guide to learn how to use my setup. 
*Note: You will be greeted with a black screen. You need to type Mod + M to load the wallpaper and polybar. To open an app, type Mod + P*


## Shortcuts Guide
*Mod is the Windows Key*
Set Wallpaper and Polybar  -  Mod + M *(useful especially when connecting to an external monitor to refresh wallpaper)*
Search for an App  -  Mod + P
Open Terminal  -  Mod + Enter
Switch Windows  -  Mod + Number Key
Send Tab to New Window  -  Mod + Shift + Number Key 
Close Tab  -  Mod + Shift + Q
Resize Window  -  Mod + R  (Esc to exit resize mode)


## Sway
I recently switched to sway. While I enjoyed my i3 experience, I wanted to give it a try. I ended up liking sway so much that it is my current window manager of choice. Running the install script should also set up sway. Once you restart/logout, you should have to option to select sway. Many of my keybinds for i3 carry over for sway. Whichever window manager you choose, I hope everything goes well. 

With that, thanks for checking out my setup guide!
Enjoy your new setup! 🎉🎉🎉

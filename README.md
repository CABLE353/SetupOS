# Welcome to SetupOS!!! #




Hello! CABLE53 here. These are the instructions & some quick details on how to use what I like to call a "simpler & primitive reverse pixie booting without the PXE"😁(trust me it's all offline and safe) to install the Windows 11 OS on multiple PC's quickly(& help to hopefully better compete with the mac DFU deployment; you're welcome ms🙄).

With PXE booting starting to fall out of fashion due to security issues, CEO issues, & whatnot; I've decided to take matters into my own hands & revive this functionality in a different, but simple primitive way. It all runs natively inside the WindowsPE environment, offline(if you want it to), & you can boot right into it(using the Installation Media provided by either ms itself or your entity). The SetupOS script(Via the wpeshl.ini file in the Installation Media) is able to load as WindowsPE boots up. A series of checks will then be run when the script first starts. The first one finds what the USB Drive mounted to, & runs the setup.exe from the USB drive in case you need to do it that way. The seccond check initializes the network card a few times with the default drivers included with WindowsPE, & the 3rd & last check will display output of the ```ipconfig``` command. A pause will be executed afterwards to give users a chance to view the output of the ```ipconfig``` command to make sure that the Client can see the Host(important). Then it will ```cls``` & finally load into the DLA menu explained more in the Readme file below.

I Also made sure that in each ```.bat``` file, each command is explained; & if you don't like something(or get suspicious about anything😥), well since it's just command prompt, you're free to open notepad or whatever & edit/lookover/examine this stuff to get what you want/need. I'm a bit of a noobe, so please be patient. This is my first GitHub Release or whatever it's called. This all took me a few months to update & grind out but I finally got a working concept, & it's something cool that I wanted to share to whomever wants to test it & maybe make better(less clunky).

If you choose(_not recomended_) to share an internet connection with the Host PC & allowing that connection through to the Switch you plan to plug your Client PC's into, let it be known HERE that depending on how many computers & ports you plan to have, an IP address will have to be assigned to each device. Plan for alot of network traffic since this program points to files & installation media on the Host PC & transfers it through to the client via an ethenet cable.





## Tools You'll Need ##

	A host computer(a computer that will host all of the installation media files & folders offline).

	A USB Drive that _You Have_ that's used for booting installation media(It has to be OS installer files you own of course).
	
	A network switch or wherever you can find a ton of ethernet ports for your Host PC(Wifi support Coming soon hopefully).

	Ethernet cables to the amount of ports your computer and/or switch can take.

	Chargers for each type of Windows machine(Recomended).

	The ability to have a network share folder(Offline share of course if you so choose).

	The files in this SetupOS Package folder.

	Patience.

	And some PC's needing a fresh install of Windows 10/11.



## Meeting The Files & Folders ##

```setupos.bat```: I help point the Client PC's in the right direction. I'm located on the USB Installation Media drive.

```jobOps.bat```: I display a list of many job Options that you may need, from the Automated Windows 11 Setup to Wiping Surplus Machines. I'm located on the Host PC's "Win11" folder. You can also add more jobs to the job list I have!

```test2.bat```: I'm just a bridge between jobOps.bat & test2.vbs. I'm also located on the Host PC "Win11" folder.

```test2.vbs```: I run the setup.exe file with a little flare...I do every keystroke for you! The last time you should be touching anything is when you choose the Automated Setup option in jobOps.bat. I'm also located in the "Win11" folder.

```vacuum.bat```: I'm the one that runs diskpart for your Surplus Machine wiping needs. I live in the "Win11" folder too!

```Win11 Folder```: I store the files on the Host PC in a network share accessible via the net use command inside the ```SetupOS.bat``` file!

```SetupOSPackages.zip```: I carry all of the files you'll meet from this github page to your Downloads folder; or wherever you choose to put me.

```Enviroset.bat```: I'm basically the installer. If you choose, you can set it up without me & do it yourself manually using the instructions below, but I do save time & make things easier. I live wherever you choose to put the SetupOSPackages.zip file as we're kindof a Package deal!


## Manual Setup Instructions ##

**Step 1:**   Start your Host PC with an internet connection to run software updates, then when updates are done unplug or disconnect it from the internet, and create a folder named "Win11", in the \Users\YourUsernameGoesHere\ directory of the C drive(System Drive).

**Step 2:**  Copy ALL USB installation media contents to your newly created folder "Win11".

**Step 3a:**   Share this folder & its contents to the Everyone group in the network share folder properties.

**Step 3b**:  Go to ```Settings>Advanced Network Settings>Advanced Sharing Settings```, and switch off the "Password Protection" option underneath the "All Networks" dropdown since Windows 11 at the time of writting is still going through some design changes away from the traditional tools & settings by slowly moving all or most of the settings out of Control Panel, & either putting them into the Settings Applet or turning them into their own Applets. The communication with this setting is a little weird with the Network Share side of things, so while the Applet switch is off it is still enabled in the system & will function as if the switch is still on. If the Applet switch isn't turned off, then when the "net use" command is run, it won't accept the correct password, as it thinks it's always an incorrect password(I have no idea why or how this is, but it is🤷‍♂️).

**Step 4:**   Proceed to connect a network switch to your computer via Ethernet cable(Switch<-->Host PC). DO NOT PLUG YOUR SWITCH/SWITCHES INTO THE INTERNET NETWORK!

**Step 5:**   Connect as many Ethernet Cables that your switch can handle(You may also daisy chain switches to get more Ethernet ports).

**Step 6:**   Copy the file "setupos.bat" from this folder to the installation media USB drive.

**Step 7:**   Copy the "jobOps.bat", "test2.vbs", "test2.bat", "vacuum.bat" files, along with all other files & folders in the "SetupOS Package" folder, to your newly created folder "Win11".

**Step 8:**   Find the name of your Host Computer & note its credentials. Open the "setupos.bat" file in notepad and go to the lines that have the "net use" command in them. Put your Host PC name as shown in the file. Replace the "username password" with your Host PC's username & password with a space in-between without quotes; "username password"(some of the "net use" lines don't have the username & password integration because some PC's won't store credentials due to policies set, & depending on which department the Client PC came from, so those options are there so you can enter them in manually), the username & password of your machine should be put in exactly like it is on your Host PC because those fields are CASE SENSITIVE. Be sure to save the changes before exiting.

Congrats!! Your setup should now be ready to wheel-and-deal the Installation of Windows 11 & run other tools for Surplus PC's!


## Using The Setup ##

**Step 1:**  Connect as many Client PC's as you have Ethernet cables & chargers.
**Step 2:**  Boot each Client PC to the Automatic Repair Menu/Advanced Startup Menu(Shift + Click Restart, or hard shutoff PC during boot repeatedly until it "Prepares Automatic Repair").
**Step 3:**  Choose Advanced Options>Troubleshoot>Command Prompt.
**Step 4:**  Connect the USB Drive with the "setupos.bat" file to one of the Client PC's.
**Step 5:**  This part can be a little tricky...My drive mounts to either letters "D", or "E". If your flash drive doesn't mount to either of these, then type 'notepad' and hit enter to open notepad, then press Ctrl+O to open a headless Files Explorer to find out where your drive is, then enter the letter that the USB Drive is mounted to. Type your drive letter like this(without quotes); "D:" and hit enter. Now that you're in the USB Drive, type "setupos" without quotes & hit enter to start the first batch file.

**Step 6:**  The setupos.bat file will first initialize the network card in the Client PC, after it does, it will then run an ipconfig command to check if the Client PC sees the Host PC. If no output is returned, then the cable has not been initialized or found, & you'll need to check every connection(if you have a switch make sure to check the power cord) to make sure that the Host PC & the Client PC are connected, then the setupos.bat file needs to be re-run(Press Ctrl+C to terminate the process, then re-run the program from Step 5), if a "Media disconnected" is returned it means that the Client PC Network Card hasn't found the Host PC and this will also need a re-run of the setupos.bat program until it does. If the ipconfig returns an ipv4 address(usually starts with "255.") then the Client PC has found the Host PC and you can continue the program by pressing any key.

**Step 7:**  You've made it to the DLA Menu(confetti & popper noises)!!!! The DLA Menu is, & stands for, Drive Letter Assosiations. Each Client PC will need to mount the Host PC "Win11" folder to a drive letter. Each of the drive letters cannot be chosen twice during each batch of Client PC's. There are some options with credential integration and some without. This is explained above in the Setup Instructions Step 8.

**Step 8:**  After you've chosen one of the drive letter mounts, you may now choose from the jobs provided in the list (depending on your situation). When this menu appears, you can yank the USB drive out & start on the next Client PC. If a window pops up and closes with no menu appearing, check the connection between the Client PC, Switch, Host PC, & the power cable connection to your Switch, then just choose the option again. If no menu appears restart the setupOS program. If that doesn't work restart the process from Using The Setup Step 2 & make sure everything's connected correctly & securely.


## Extra Things To Note ##

The Windows 11 Automated Setup keystrokes every mouse click for you. Please note that if anything is touched during this part of the process, it WILL put those keystrokes where you don't want them and there is NO WAY TO STOP IT as far as my knowledge takes me. You don't have to touch the Client PC again _until_ it boots the OOBE(Out Of Box Experience) setup options _after_ Windows installs(like keyboard layout & waiting for the Church Support user to automatically login).

The seccond option available (Automated DiskPart) is for mass wiping Surplus PC's.

The 3rd option allows you to go through the Windows 11 setup settings manually if you need to.

The 4th option is well _Your choice_! Yes that's right!, if you know a little bit of cmd scripting(or know how to do your research), you can add whatever & however many custom options you want to this file & it will appear with the rest of the others😉.


## Closure ##

Thanks for getting through all of that, if you have any questions I guess just submit stuff on the Issues Page. I guess one could say that this entire project is basically scripts calling other scripts to do scripty things that you decide to script😂.

If you're really really really tech savy(your 2nd language just so happens to be cmd lingo) and you know what I'm doing(or trying to do😁) in this program, & want to help make this process better & more stable either just for you or for everyone, then feel free to just change what you want in your environment, & maybe hopefully possibly share your creation by forking SetupOS 😉.

Also please understand that what _**YOU**_ do with this tool is **_YOUR_** responsibility. I can't be held liable for **_ANY_** misuse or casual & unsecure operations or configurations of this tool.

Please be sure to leave feedback! I would love to know if anybody likes it.

I hope this thing helps someone out there in the deployment world.
Enjoy!!!

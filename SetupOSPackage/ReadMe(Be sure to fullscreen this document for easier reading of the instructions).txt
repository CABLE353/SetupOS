Hello! Elder Eagar here; these are the instructions on how to use the reverse pixie(trust me it's all offline and safe) to install the Windows 11 OS on multiple PC's quickly.

Things you'll need:

	A host computer(a computer that will host all of the installation media files & folders offline).

	The USB Drive that was typically used for booting the installation media.
	
	A network switch or wherever you can find a ton of ethernet ports for your host PC.

	Ethernet cables to the amount of ports your computer and/or switch can take.

	Adapters for your PC to connect to the ethernet cable.

	Chargers for each type of Windows machine(Dell usb-c chargers will work for most laptops with usb-c ports).

	The ability to host an offline network share folder(Offline share of course).

	The files in this SetupOS Package folder.

	Patience.

	And some PC's needing a fresh install of Windows 11.



------------------------------------------Meeting The Files-------------------------------------------

setupos.bat: I help point the Client PC's in the right direction. I'm located on the USB Installation Media drive.

jobOps.bat: I display a list of 2 job Options that you may need, from the Automated Windows 11 Setup to Wiping Surplus Machines. I'm located on the Host PC's "Win11" folder.

vbsbridge.bat: I'm just a bridge between jobOps.bat & autosetup.vbs. I'm also located on the Host PC "Win11" folder.

autosetup.vbs: I run the setup.exe file with a little flare...I do every keystroke for you! The last time you should be touching anything is when you choose the Automated Setup option in jobOps.bat. I'm also located in the "Win11" folder.

vacuum.bat: I'm the one that runs diskpart for your Surplus Machine wiping needs. I live in the "Win11" folder too!



-------------------------------------------Setup Instructions---------------------------------

Step 1:   Start your host computer(Host PC has to be a Windows PC), and create a folder named "Win11". Make sure that the Host PC is offline.

Step 2:   Copy ALL USB installation media contents to your newly created folder "Win11".

Step 3:   Share this folder & its contents to the Everyone group in the network share folder properties.

Step 4:   Proceed to connect a network switch to your computer via Ethernet cable(Switch<-->Host PC).

Step 5:   Connect as many Ethernet Cables that your switch can handle(You may also daisy chain switches to get more Ethernet ports).

Step 6:   Copy the file "setupos.bat" from this folder to the installation media USB drive.

Step 7:   Copy the "jobOps.bat", "autosetup.vbs", "vbsbridge.bat", & "vacuum.bat" files to your newly created folder "Win11".

Step 8:   Find the name of your Host Computer & note its credentials. Open the "setupos.bat" file in notepad and go to lines that have the "net use" command in them. Put your Host PC name as shown in the file. Replace the "username password" with your Host PC's username & password with a space in-between(some of the "net use" lines don't have the username & password integration because  some PC's won't store credentials due to policies depending on which department the client PC came from, so those options are there so you can enter them in manually), be sure to save the changes before exiting.

Congrats!! Your setup should now be ready to wheel-and-deal the Installation of Windows 11 & run diskpart for Surplus PC's!


------------------------------------------Using The Setup-------------------------------------------

Step 1:  Connect as many Client PC's as you have Ethernet cables & chargers.
Step 2:  Boot each Client PC to the Automatic Repair Menu/Advanced Startup Menu(Shift+Click Restart, you can also hard shutoff the PC during boot until it "Prepares Automatic Repair"), or boot the USB drive, click Next>Repair My PC in the installation media.
Step 3:  Choose Advanced Options>Troubleshoot>Command Prompt.
Step 4:  Connect the USB Drive with the "setupos.bat" file to one of the Client PC's.
Step 5:  This part can be a little tricky...My drive mounts to either letters "D", or "E". If your flash drive doesn't mount to either of these, then type 'notepad' and hit enter to open notepad, then press Ctrl+O to open a headless Files Explorer to find out where your drive is, then enter the letter that the USB Drive is mounted to. Type your drive letter like this(without quotes); "D:" and hit enter. Now that you're in the USB Drive, type "setupos" without quotes & hit enter to start the first batch file.

Step 6:  The setupos.bat file will first initialize the network card in the Client PC, after it does, it will then run an ipconfig command to check if the Client PC sees the Host PC. If no output is returned, then the card has not been initialized, & the setupos.bat file needs to be re-run(Press Ctrl+C to terminate the process, then re-run the program from Step 5), if a "Media disconnected" is returned it means that the Client PC Network Card hasn't found the Host PC and this will also need a re-run of the setupos.bat program until it does. If the ipconfig returns an ipv4 address(usually starts with 255. etc.) then the Client PC has found the Host PC and you can continue the program by pressing any key(not THE Any Key; for there is no such abomination).

Step 7:  The DLA menu is for Drive Letter Associations. Each Client PC will need to mount the Host PC "Win11" folder to a drive letter. Each of the drive letters cannot be chosen twice during each batch of Client PC's. There are some options with credential integration and some without. This is explained above in the Setup Instructions Step 8.

Step 8:  After you've chosen one of the drive letter mounts, you may now choose from the 2 jobs provided in the list depending on your situation. When this menu appears, you're ok to yank the USB drive out & start on the next Client PC. If a window pops up and closes with no menu appearing, check the connection between the Client PC, Switch, & Host PC and also check the power cable connection to your Switch, then just choose the option again. If no menu appears restart the setupos program. If that doesn't work restart the process from Step 2 & make sure everything's connected correctly & securely.


----------------------------------------Extra Things To Note------------------------------------------
The Windows 11 Automated Setup keystrokes every mouse click for you. Please note that if anything is touched during this part of the process, it WILL put those keystrokes else where you don't want them and there is NO WAY TO STOP IT. You don't have to touch the Client PC again until you start doing the OOBE(Out Of Box Experience) setup options after Windows installs(like keyboard layout & waiting for the Church Support user to automatically login).

The second option available is the Automated Diskpart for wiping Surplus PC's.

If you're having troubles with the Windows 11 Automated Setup, then there's always the manual option where you setup the image like normal(going through each prompt or section of the setup installer).

----------------------------------------Closure--------------------------------------------------------

Thanks for getting through all of that, if you have any questions just message me on Teams at "Caleb Eagar" and I will get to you when I get time away from my TSM Missionary assignment here at the ROB.

If you're really, really tech savvy and know what I'm doing here in this program & want to help make this process more stable & better, then feel free to change what you want  ;]  & be sure share your upgrades.

Enjoy!!!
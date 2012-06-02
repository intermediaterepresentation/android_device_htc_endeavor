# HTC Endeavor (aka One X)

## Installation Instructions

1. Download the latest pre-built version of the ROM from [here](http://mirror.faked.org/cm9/), or build it yourself (see below)
2. Enter fastboot mode on your phone, and connect it to your computer
3. Erase your phone's cache with the following command: `fastboot erase cache`
4. Flash the boot.img from inside the zip file to your phone's partition with the following command: `fastboot flash boot boot.img`
5. Enter recovery on your phone
6. Do a nandroid backup of your phone, in case something goes wrong
7. If you're coming from another ROM, wipe data and wipe cache, otherwise a data wipe may not be necessary.
8. Flash the zip file you've previously downloaded or built


## Building the ROM yourself

Add the following to your local_manifest.xml:

	<project name="intermediaterepresentation/android_kernel_htc_endeavor" path="kernel/htc/endeavor" remote="github" />
  	<project name="intermediaterepresentation/android_device_htc_endeavor" path="device/htc/endeavoru" remote="github" />

Sync:

	repo sync

Build:

	add_lunch_combo cm_endeavoru-userdebug
	lunch cm_endeavoru-userdebug
	(cd device/htc/endeavoru && ./extract_files.sh)
	make -j4 otapackage

## Links

* [Discussion thread on XDA](http://forum.xda-developers.com/showthread.php?t=1661629)
* [Build history](http://faked.org/jenkins)
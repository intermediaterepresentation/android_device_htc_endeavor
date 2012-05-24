# HTC Endeavor (aka One X)

Add the following to your local_manifest.xml:

	<project name="intermediaterepresentation/android_hardware_ti_wlan" path="hardware/ti/wlan" remote="github" revision="p-ics-mr1-release"/>
  	<project name="intermediaterepresentation/android_kernel_htc_endeavor" path="kernel/htc/endeavor" remote="github" />
  	<project name="intermediaterepresentation/android_device_htc_endeavor" path="device/htc/endeavoru" remote="github" />

Sync:

	repo sync

Build:

        add_lunch_combo cm_endeavoru-userdebug
	lunch cm_endeavoru-userdebug
	(cd device/htc/endeavoru && ./extract_files.sh)
	make -j4 otapackage

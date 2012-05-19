# Endeavor

Add the following to your local_manifest.xml:

	<project name="intermediaterepresentation/android_hardware_ti_wlan" path="hardware/ti/wlan-omapzoom" remote="github" revision="p-ics-mr1-release"/>
  	<project name="intermediaterepresentation/android_kernel_htc_endeavor" path="kernel/htc/endeavor" remote="github" />
  	<project name="intermediaterepresentation/android_device_htc_endeavor" path="device/htc/endeavor" remote="github" />

Build:

	lunch cm_endeavor-userdebug
	make -j4 otapackage

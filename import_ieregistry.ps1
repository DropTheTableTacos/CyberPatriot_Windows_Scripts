# Restrict Accelerators to those deployed through Group Policy
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Activities\Restrictions" -Force | New-ItemProperty -Name "UsePolicyActivitiesOnly" -PropertyType DWord -Value "1" -Force

# Turn off Accelerators
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Activities" -Force | New-ItemProperty -Name "NoActivities" -PropertyType DWord -Value "1" -Force

# Bypass prompting for Clipboard access for scripts running in any process
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\Feature_Enable_Script_Paste_URLAction_If_Prompt" -Force | New-ItemProperty -Name "*" -PropertyType String -Value "0" -Force

# Bypass prompting for Clipboard access for scripts running in the Internet Explorer process
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\Feature_Enable_Script_Paste_URLAction_If_Prompt" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\Feature_Enable_Script_Paste_URLAction_If_Prompt" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\Feature_Enable_Script_Paste_URLAction_If_Prompt" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "0" -Force

# Define applications and processes that can access the Clipboard without prompting
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl" -Force | New-ItemProperty -Name "ListBox_Support_Feature_Enable_Script_Paste_URLAction_If_Prompt" -PropertyType DWord -Value "1" -Force

# Turn off Print Menu
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions" -Force | New-ItemProperty -Name "NoPrinting" -PropertyType DWord -Value "1" -Force

# Turn off the ability to launch report site problems using a menu option
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "NoReportSiteProblems" -PropertyType String -Value "no" -Force

# Include updated website lists from Microsoft
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserEmulation" -Force | New-ItemProperty -Name "MSCompatibilityMode" -PropertyType DWord -Value "1" -Force

# Turn off Compatibility View button
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\CommandBar" -Force | New-ItemProperty -Name "ShowCompatibilityViewButton" -PropertyType DWord -Value "1" -Force

# Turn off Compatibility View
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserEmulation" -Force | New-ItemProperty -Name "DisableSiteListEditing" -PropertyType DWord -Value "0" -Force

# Turn on Internet Explorer 7 Standards Mode
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserEmulation" -Force | New-ItemProperty -Name "AllSitesCompatibilityMode" -PropertyType DWord -Value "1" -Force

# Turn on Internet Explorer Standards Mode for local intranet
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserEmulation" -Force | New-ItemProperty -Name "IntranetCompatibilityMode" -PropertyType DWord -Value "1" -Force

# Prevent specifying the code download path for each computer
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "CodeBaseSearchPath" -PropertyType String -Value "CODEBASE" -Force

# Allow active content from CDs to run on user machines
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" -Force | New-ItemProperty -Name "LOCALMACHINE_CD_UNLOCK" -PropertyType DWord -Value "0" -Force

# Allow Install On Demand (except Internet Explorer)
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "NoWebJITSetup" -PropertyType DWord -Value "1" -Force

# Allow Install On Demand (Internet Explorer)
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "NoJITSetup" -PropertyType DWord -Value "1" -Force

# Allow Internet Explorer to use the SPDY/3 network protocol
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "EnableSPDY3_0" -PropertyType DWord -Value "1" -Force

# Allow software to run or install even if the signature is invalid
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Download" -Force | New-ItemProperty -Name "RunInvalidSignatures" -PropertyType DWord -Value "0" -Force

# Allow third-party browser extensions
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Enable Browser Extensions" -PropertyType String -Value "no" -Force

# Always send Do Not Track header
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "DoNotTrack" -PropertyType DWord -Value "1" -Force

# Check for server certificate revocation
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "CertificateRevocation" -PropertyType DWord -Value "1" -Force

# Check for signatures on downloaded programs
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Download" -Force | New-ItemProperty -Name "CheckExeSignatures" -PropertyType String -Value "yes" -Force

# Do not allow ActiveX controls to run in Protected Mode when Enhanced Protected Mode is enabled
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "DisableEPMCompat" -PropertyType DWord -Value "1" -Force

# Do not allow resetting Internet Explorer settings
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "DisableRIED" -PropertyType DWord -Value "0" -Force

# Do not save encrypted pages to disk
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "DisableCachingOfSSLPages" -PropertyType DWord -Value "1" -Force

# Empty Temporary Internet Files folder when browser is closed
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Cache" -Force | New-ItemProperty -Name "Persistent" -PropertyType DWord -Value "0" -Force

# Play animations in web pages
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Play_Animations" -PropertyType String -Value "yes" -Force

# Play sounds in web pages
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Play_Background_Sounds" -PropertyType String -Value "yes" -Force

# Play videos in web pages
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Display Inline Videos" -PropertyType String -Value "yes" -Force

# Turn off ClearType
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "UseClearType" -PropertyType String -Value "yes" -Force

# Turn off encryption support
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "SecureProtocols" -PropertyType DWord -Value "2560" -Force

# Turn off loading websites and content in the background to optimize performance
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\PrefetchPrerender" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "1" -Force

# Turn off Profile Assistant
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Security\P3Global" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "0" -Force

# Turn off sending UTF-8 query strings for URLs
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "UTF8URLQuery" -PropertyType DWord -Value "3" -Force

# Turn off the flip ahead with page prediction feature
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\FlipAhead" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "1" -Force

# Turn on 64-bit tab processes when running in Enhanced Protected Mode on 64-bit versions of Windows
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Isolation64Bit" -PropertyType DWord -Value "1" -Force

# Turn on Caret Browsing support
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\CaretBrowsing" -Force | New-ItemProperty -Name "EnableOnStartup" -PropertyType DWord -Value "1" -Force

# Turn on Enhanced Protected Mode
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Isolation" -PropertyType String -Value "PMEM" -Force

# Use HTTP 1.1 through proxy connections
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "ProxyHttp1.1" -PropertyType DWord -Value "1" -Force

# Use HTTP 1.1
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "EnableHttp1_1" -PropertyType DWord -Value "1" -Force

# Show Content Advisor on Internet Options
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "ShowContentAdvisor" -PropertyType DWord -Value "1" -Force

# Allow websites to store application caches on client computers
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\AppCache" -Force | New-ItemProperty -Name "AllowWebsiteCaches" -PropertyType DWord -Value "1" -Force

# Allow websites to store indexed databases on client computers
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\IndexedDB" -Force | New-ItemProperty -Name "AllowWebsiteDatabases" -PropertyType DWord -Value "1" -Force

# Set application caches expiration time limit for individual domains
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\AppCache" -Force | New-ItemProperty -Name "GarbageCollectionThresholdInDays" -PropertyType DWord -Value "0" -Force

# Set application cache storage limits for individual domains
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\AppCache" -Force | New-ItemProperty -Name "MaxTrustedDomainLimitInMB" -PropertyType DWord -Value "50" -Force

# Set default storage limits for websites
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage" -Force | New-ItemProperty -Name "DefaultDomainCacheLimitInMB" -PropertyType DWord -Value "10" -Force

# Set indexed database storage limits for individual domains
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\IndexedDB" -Force | New-ItemProperty -Name "MaxTrustedDomainLimitInMB" -PropertyType DWord -Value "500" -Force

# Set maximum application cache individual resource size
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\AppCache" -Force | New-ItemProperty -Name "ManifestSingleResourceQuotaInMB" -PropertyType DWord -Value "50" -Force

# Set maximum application cache resource list size
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\AppCache" -Force | New-ItemProperty -Name "ManifestResourceQuota" -PropertyType DWord -Value "1000" -Force

# Set maximum application caches storage limit for all domains
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\AppCache" -Force | New-ItemProperty -Name "TotalLimitInMB" -PropertyType DWord -Value "1024" -Force

# Set maximum indexed database storage limit for all domains
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\BrowserStorage\IndexedDB" -Force | New-ItemProperty -Name "TotalLimitInMB" -PropertyType DWord -Value "4096" -Force

# Start Internet Explorer with tabs from last browsing session
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\ContinuousBrowsing" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "0" -Force

# Internet Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "Internet" -PropertyType DWord -Value "4" -Force

# Intranet Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "Intranet" -PropertyType DWord -Value "4" -Force

# Restricted Sites Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "RestrictedSitesZoneTemplate" -PropertyType DWord -Value "4" -Force

# Local Machine Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "LocalMachineZoneTemplate" -PropertyType DWord -Value "4" -Force

# Trusted Sites Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "TrustedSitesZoneTemplate" -PropertyType DWord -Value "4" -Force

# Locked-Down Internet Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "InternetZoneLockdownTemplate" -PropertyType DWord -Value "4" -Force

# Locked-Down Intranet Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "IntranetZoneLockdownTemplate" -PropertyType DWord -Value "4" -Force

# Locked-Down Restricted Sites Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "RestrictedSitesZoneLockdownTemplate" -PropertyType DWord -Value "4" -Force

# Locked-Down Local Machine Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "LocalMachineZoneLockdownTemplate" -PropertyType DWord -Value "4" -Force

# Locked-Down Trusted Sites Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "TrustedSitesZoneLockdownTemplate" -PropertyType DWord -Value "4" -Force

#  Zone Template
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "" -PropertyType DWord -Value "4" -Force

# Zone template settings
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1001" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1004" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1200" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1201" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1206" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1207" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1208" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1209" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "120a" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "120b" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1400" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1402" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1405" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1406" -PropertyType DWord -Value "3" -Force

# Allow cut, copy or paste operations from the clipboard via script
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1407" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1409" -PropertyType DWord -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1601" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1604" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1605" -PropertyType DWord -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1606" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1607" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1608" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1609" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "160A" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1800" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1802" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1803" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1804" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1807" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1808" -PropertyType DWord -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1809" -PropertyType DWord -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "180a" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "180b" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1a00" -PropertyType DWord -Value "65536" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1a02" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1a03" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1a04" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1a05" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1a06" -PropertyType DWord -Value "3" -Force

# Java permissions
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1c00" -PropertyType DWord -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "1e05" -PropertyType DWord -Value "65536" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2000" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2001" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2004" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2005" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2100" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2101" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2102" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2103" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2104" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2105" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2106" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2200" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2201" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2300" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2301" -PropertyType DWord -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2400" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2401" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2402" -PropertyType DWord -Value "3" -Force

# Turn on Protected Mode
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2500" -PropertyType DWord -Value "0" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2600" -PropertyType DWord -Value "3" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Template Policies" -Force | New-ItemProperty -Name "2700" -PropertyType DWord -Value "0" -Force

# Prevent ignoring certificate errors
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "PreventIgnoreCertErrors" -PropertyType DWord -Value "1" -Force

# Send internationalized domain names
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "EnablePunyCode" -PropertyType DWord -Value "3" -Force

# Use UTF-8 for mailto links
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Protocols\Mailto" -Force | New-ItemProperty -Name "UTF8Encoding" -PropertyType DWord -Value "1" -Force

# Go to an intranet site for a one-word entry in the Address bar
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "GotoIntranetSiteForSingleWordEntry" -PropertyType DWord -Value "0" -Force

# Turn off phone number detection
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FormatDetection" -Force | New-ItemProperty -Name "PhoneNumberEnabled" -PropertyType DWord -Value "0" -Force

# Allow Internet Explorer to play media files that use alternative codecs
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "EnableAlternativeCodec" -PropertyType String -Value "yes" -Force

# Prevent configuration of search on Address bar
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "AutoSearch" -PropertyType DWord -Value "0" -Force

# Turn off URL Suggestions
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\DomainSuggestion" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "0" -Force

# Turn off Windows Search AutoComplete
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\WindowsSearch" -Force | New-ItemProperty -Name "EnabledScopes" -PropertyType DWord -Value "0" -Force

# Prevent specifying cipher strength update information URLs
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion" -Force | New-ItemProperty -Name "IEAKUpdateUrl" -PropertyType String -Value "http://www.microsoft.com/isapi/redir.dll?prd=ie&ar=128bit" -Force

# Prevent changing the URL for checking updates to Internet Explorer and Internet Tools
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Update_Check_Page" -PropertyType String -Value "http://www.microsoft.com/isapi/redir.dll?Prd=ie&Pver=5.0&Ar=ie5update" -Force

# Prevent specifying the update check interval (in days)
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Update_Check_Interval" -PropertyType DWord -Value "30" -Force

# Open Internet Explorer tiles on the desktop
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "ApplicationTileImmersiveActivation" -PropertyType DWord -Value "1" -Force

# Set how links are opened in Internet Explorer
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "AssociationActivationMode" -PropertyType DWord -Value "2" -Force

# Establish InPrivate Filtering threshold
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" -Force | New-ItemProperty -Name "Threshold" -PropertyType DWord -Value "10" -Force

# Establish Tracking Protection threshold
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" -Force | New-ItemProperty -Name "TrackingProtectionThreshold" -PropertyType DWord -Value "10" -Force

# Prevent the computer from loading toolbars and Browser Helper Objects when InPrivate Browsing starts
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" -Force | New-ItemProperty -Name "DisableToolbars" -PropertyType DWord -Value "1" -Force

# Turn off collection of InPrivate Filtering data
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" -Force | New-ItemProperty -Name "DisableLogging" -PropertyType DWord -Value "1" -Force

# Turn off InPrivate Browsing
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Privacy" -Force | New-ItemProperty -Name "EnableInPrivateBrowsing" -PropertyType DWord -Value "1" -Force

# Turn off InPrivate Filtering
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" -Force | New-ItemProperty -Name "DisableInPrivateBlocking" -PropertyType DWord -Value "1" -Force

# Turn off Tracking Protection
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\PrivacIE" -Force | New-ItemProperty -Name "DisableTrackingProtection" -PropertyType DWord -Value "0" -Force

# Do not display the reveal password button
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "DisablePasswordReveal" -PropertyType DWord -Value "1" -Force

# Prevent bypassing SmartScreen Filter warnings
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter" -Force | New-ItemProperty -Name "PreventOverride" -PropertyType DWord -Value "1" -Force

# Prevent bypassing SmartScreen Filter warnings about files that are not commonly downloaded from the Internet
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\PhishingFilter" -Force | New-ItemProperty -Name "PreventOverrideAppRepUnknown" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions" -Force | New-ItemProperty -Name "NoExtensionManagement" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKCU:\Software\Policies\Microsoft\Internet Explorer\Restrictions" -Force | New-ItemProperty -Name "NoSelectDownloadDir" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Security\ActiveX" -Force | New-ItemProperty -Name "BlockNonAdminActiveXInstall" -PropertyType DWord -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AxInstaller" -Force | New-ItemProperty -Name "OnlyUseAXISForActiveXInstall" -PropertyType DWord -Value "1" -Force

# Turn on ActiveX Filtering
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Safety\ActiveXFiltering" -Force | New-ItemProperty -Name "IsEnabled" -PropertyType DWord -Value "1" -Force

# Turn off ActiveX Opt-In prompt
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" -Force | New-ItemProperty -Name "NoFirsttimeprompt" -PropertyType DWord -Value "0" -Force

# Do not allow ActiveX controls to run in Protected Mode when Enhanced Protected Mode is enabled
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "DisableEPMCompat" -PropertyType DWord -Value "1" -Force

# Disable "Configuring History"
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "History" -PropertyType DWord -Value "1" -Force

# Days to keep pages in History
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Url History" -Force | New-ItemProperty -Name "DaysToKeep" -PropertyType DWord -Value "40" -Force

# Prevent access to Delete Browsing History
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "DisableDeleteBrowsingHistory" -PropertyType DWord -Value "1" -Force

# Turn on certificate address mismatch warning
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force | New-ItemProperty -Name "WarnOnBadCertRecving" -PropertyType DWord -Value "1" -Force

# Disable changing certificate settings
New-Item -Path "HKCU:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "Certificates" -PropertyType DWord -Value "1" -Force

# Turn off browser geolocation
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Geolocation" -Force | New-ItemProperty -Name "PolicyDisableGeolocation" -PropertyType DWord -Value "1" -Force

# Restrict ActiveX install for Internet Explorer Processes
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_ACTIVEXINSTALL" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_ACTIVEXINSTALL" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_ACTIVEXINSTALL" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "1" -Force

# Restrict window scripts for Internet Explorer Processes
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_WINDOW_RESTRICTIONS" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_WINDOW_RESTRICTIONS" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_WINDOW_RESTRICTIONS" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "1" -Force

# Mime Sniffing Safety Feature for Internet Explorer Processes
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_SNIFFING" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_SNIFFING" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_SNIFFING" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "1" -Force

# Notification bar for Internet Explorer Processes
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_SECURITYBAND" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_SECURITYBAND" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_SECURITYBAND" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "1" -Force

# MK Protocol Security Restriction for Internet Explorer Processes
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_DISABLE_MK_PROTOCOL" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_DISABLE_MK_PROTOCOL" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_DISABLE_MK_PROTOCOL" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "1" -Force

# Consistent MIME Handling for Internet Explorer Processes
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_HANDLING" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_HANDLING" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MIME_HANDLING" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "1" -Force

# Restrict file download for Internet Explorer Processes
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_FILEDOWNLOAD" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_FILEDOWNLOAD" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_RESTRICT_FILEDOWNLOAD" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "1" -Force

# Protection From Zone Elevation for Internet Explorer Processes
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ZONE_ELEVATION" -Force | New-ItemProperty -Name "(Reserved)" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ZONE_ELEVATION" -Force | New-ItemProperty -Name "explorer.exe" -PropertyType String -Value "1" -Force

New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ZONE_ELEVATION" -Force | New-ItemProperty -Name "iexplore.exe" -PropertyType String -Value "1" -Force

# Disable the Security page
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "SecurityTab" -PropertyType DWord -Value "1" -Force

# Disable the Advanced page
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "AdvancedTab" -PropertyType DWord -Value "1" -Force

# Prevent downloading of enclosures
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds" -Force | New-ItemProperty -Name "DisableEnclosureDownload" -PropertyType DWord -Value "1" -Force

# Prevent changing proxy settings
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "Proxy" -PropertyType DWord -Value "1" -Force

# Prevent "Fix settings" functionality
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Security" -Force | New-ItemProperty -Name "DisableFixSecuritySettings" -PropertyType DWord -Value "0" -Force

# Turn off the Security Settings Check feature
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Security" -Force | New-ItemProperty -Name "DisableSecuritySettingsCheck" -PropertyType DWord -Value "0" -Force

# Turn off Crash Detection
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Restrictions" -Force | New-ItemProperty -Name "NoCrashDetection" -PropertyType DWord -Value "1" -Force

# Disable AutoComplete for forms
New-Item -Path "HKCU:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "Use FormSuggest" -PropertyType String -Value "no" -Force

New-Item -Path "HKCU:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "FormSuggest" -PropertyType DWord -Value "1" -Force

# Turn on the auto-complete feature for user names and passwords on forms
New-Item -Path "HKCU:\Software\Policies\Microsoft\Internet Explorer\Main" -Force | New-ItemProperty -Name "FormSuggest Passwords" -PropertyType String -Value "no" -Force

New-Item -Path "HKCU:\Software\Policies\Microsoft\Internet Explorer\Control Panel" -Force | New-ItemProperty -Name "FormSuggest Passwords" -PropertyType DWord -Value "1" -Force

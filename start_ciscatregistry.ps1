# CIS-CAT Massive Registry Script

New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "LimitBlankPasswordUse" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "scenoapplylegacyauditpolicy" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "crashonauditfail" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force | New-ItemProperty -Name "AllocateDASD" -PropertyType String -Value "2" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" -Force | New-ItemProperty -Name "requiresignorseal" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" -Force | New-ItemProperty -Name "sealsecurechannel" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" -Force | New-ItemProperty -Name "signsecurechannel" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" -Force | New-ItemProperty -Name "disablepasswordchange" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" -Force | New-ItemProperty -Name "requirestrongkey" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "DontDisplayLastUserName" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "DisableCAD" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "LegalNoticeText" -PropertyType String -Value "a" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "LegalNoticeCaption" -PropertyType String -Value "a" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force | New-ItemProperty -Name "cachedlogonscount" -PropertyType String -Value "4" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force | New-ItemProperty -Name "scremoveoption" -PropertyType String -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Force | New-ItemProperty -Name "RequireSecuritySignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Force | New-ItemProperty -Name "EnableSecuritySignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Force | New-ItemProperty -Name "EnablePlainTextPassword" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Force | New-ItemProperty -Name "autodisconnect" -PropertyType DWord -Value "15" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Force | New-ItemProperty -Name "requiresecuritysignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Force | New-ItemProperty -Name "enablesecuritysignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Force | New-ItemProperty -Name "enableforcedlogoff" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Force | New-ItemProperty -Name "SMBServerNameHardeningLevel" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Force | New-ItemProperty -Name "requiresecuritysignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "RestrictAnonymousSAM" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "RestrictAnonymous" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "disabledomaincreds" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "EveryoneIncludesAnonymous" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" -Force | New-ItemProperty -Name "restrictnullsessaccess" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "ForceGuest" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "UseMachineId" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Force | New-ItemProperty -Name "allownullsessionfallback" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\pku2u" -Force | New-ItemProperty -Name "AllowOnlineID" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Kerberos\Parameters" -Force | New-ItemProperty -Name "SupportedEncryptionTypes" -PropertyType DWord -Value "2147483644" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "NoLMHash" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "LmCompatibilityLevel" -PropertyType DWord -Value "5" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LDAP" -Force | New-ItemProperty -Name "LDAPClientIntegrity" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Force | New-ItemProperty -Name "NTLMMinClientSec" -PropertyType DWord -Value "537395200" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" -Force | New-ItemProperty -Name "NTLMMinServerSec" -PropertyType DWord -Value "537395200" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Cryptography" -Force | New-ItemProperty -Name "ForceKeyProtection" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Kernel" -Force | New-ItemProperty -Name "ObCaseInsensitive" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Subsystems" -Force | New-ItemProperty -Name "Optional" -PropertyType reg_multi_sz -Value " " -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "FilterAdministratorToken" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableUIADesktopToggle" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "ConsentPromptBehaviorAdmin" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "ConsentPromptBehaviorUser" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableInstallerDetection" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableSecureUIAPaths" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableLUA" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "PromptOnSecureDesktop" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "EnableVirtualization" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "FilterAdministratorToken" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" -Force | New-ItemProperty -Name "AllowLocalPolicyMerge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" -Force | New-ItemProperty -Name "AllowLocalIPsecPolicyMerge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Force | New-ItemProperty -Name "LogFilePath" -PropertyType String -Value "%systemroot^%\System32\logfiles\firewall\domainfw.log" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Force | New-ItemProperty -Name "AllowLocalPolicyMerge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Force | New-ItemProperty -Name "AllowLocalIPsecPolicyMerge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Force | New-ItemProperty -Name "LogFilePath" -PropertyType String -Value "%systemroot^%\System32\logfiles\firewall\privatefw.log" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PublicProfile" -Force | New-ItemProperty -Name "DisableNotifications" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Force | New-ItemProperty -Name "LogFilePath" -PropertyType String -Value "%systemroot^%\System32\logfiles\firewall\publicfw.log" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D-087DE603E3EA}" -Force | New-ItemProperty -Name "DllName" -PropertyType String -Value "C:\Program Files\LAPS\CSE\AdmPwd.dll" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" -Force | New-ItemProperty -Name "PwdExpirationProtectionEnabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" -Force | New-ItemProperty -Name "AdmPwdEnabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" -Force | New-ItemProperty -Name "PasswordComplexity" -PropertyType DWord -Value "4" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" -Force | New-ItemProperty -Name "PasswordLength" -PropertyType DWord -Value "15" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" -Force | New-ItemProperty -Name "PasswordAgeDays" -PropertyType DWord -Value "30" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force | New-ItemProperty -Name "AutoAdminLogon" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" -Force | New-ItemProperty -Name "DisableIPSourceRouting" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Force | New-ItemProperty -Name "DisableIPSourceRouting" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Rasman\Parameters" -Force | New-ItemProperty -Name "disablesavepassword" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Force | New-ItemProperty -Name "EnableICMPRedirect" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Force | New-ItemProperty -Name "KeepAliveTime" -PropertyType DWord -Value "300000" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\NetBT\Parameters" -Force | New-ItemProperty -Name "nonamereleaseondemand" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Force | New-ItemProperty -Name "PerformRouterDiscovery" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Session Manager" -Force | New-ItemProperty -Name "SafeDllSearchMode" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force | New-ItemProperty -Name "ScreenSaverGracePeriod" -PropertyType DWord -Value "5" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" -Force | New-ItemProperty -Name "tcpmaxdataretransmissions" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" -Force | New-ItemProperty -Name "tcpmaxdataretransmissions" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Eventlog\Security" -Force | New-ItemProperty -Name "WarningLevel" -PropertyType DWord -Value "90" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | New-ItemProperty -Name "AllowLLTDIOOndomain" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | New-ItemProperty -Name "AllowLLTDIOOnPublicNet" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | New-ItemProperty -Name "EnableLLTDIO" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | New-ItemProperty -Name "ProhibitLLTDIOOnPrivateNet" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | New-ItemProperty -Name "AllowRspndrOnDomain" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | New-ItemProperty -Name "AllowRspndrOnPublicNet" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | New-ItemProperty -Name "EnableRspndr" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" -Force | New-ItemProperty -Name "ProhibitRspndrOnPrivateNet" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Peernet" -Force | New-ItemProperty -Name "Disabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Force | New-ItemProperty -Name "NC_AllowNetBridge_NLA" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" -Force | New-ItemProperty -Name "NC_StdDomainUserSetLocation" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Force | New-ItemProperty -Name "\\*\SYSVOL" -PropertyType String -Value "RequireMutualAuthentication=1, RequireIntegrity=1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" -Force | New-ItemProperty -Name "DisabledComponents" -PropertyType DWord -Value "255" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" -Force | New-ItemProperty -Name "EnableRegistrars" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" -Force | New-ItemProperty -Name "DisableUPnPRegistrar" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" -Force | New-ItemProperty -Name "DisableInBand802DOT11Registrar" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" -Force | New-ItemProperty -Name "DisableFlashConfigRegistrar" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" -Force | New-ItemProperty -Name "DisableWPDRegistrar" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\UI" -Force | New-ItemProperty -Name "DisableWcnUi" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Force | New-ItemProperty -Name "fMinimizeConnections" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Force | New-ItemProperty -Name "fBlockNonDomain" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\wifinetworkmanager\config" -Force | New-ItemProperty -Name "AutoConnectAllowedOEM" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "LocalAccountTokenFilterPolicy" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\WDigest" -Force | New-ItemProperty -Name "UseLogonCredential" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -Force | New-ItemProperty -Name "ProcessCreationIncludeCmdLine_Enabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Force | New-ItemProperty -Name "DenyDeviceIDs" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Force | New-ItemProperty -Name "DenyDeviceIDsRetroactive" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Force | New-ItemProperty -Name "DenyDeviceClasses" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Force | New-ItemProperty -Name "DenyDeviceClassesRetroactive" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Policies\EarlyLaunch" -Force | New-ItemProperty -Name "DriverLoadPolicy" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Force | New-ItemProperty -Name "NoBackgroundPolicy" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Force | New-ItemProperty -Name "NoGPOListChanges" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Force | New-ItemProperty -Name "NoUseStoreOpenWith" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Force | New-ItemProperty -Name "DisableWebPnPDownload" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\TabletPC" -Force | New-ItemProperty -Name "PreventHandwritingDataSharing" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\HandwritingErrorReports" -Force | New-ItemProperty -Name "PreventHandwritingErrorReports" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Internet Connection Wizard" -Force | New-ItemProperty -Name "ExitOnMSICW" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | New-ItemProperty -Name "NoWebServices" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" -Force | New-ItemProperty -Name "DisableHTTPPrinting" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Registration Wizard Control" -Force | New-ItemProperty -Name "NoRegistration" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\SearchCompanion" -Force | New-ItemProperty -Name "DisableContentFileUpdates" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | New-ItemProperty -Name "NoOnlinePrintsWizard" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | New-ItemProperty -Name "NoPublishingWizard" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Messenger\Client" -Force | New-ItemProperty -Name "CEIP" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\SQMClient\Windows" -Force | New-ItemProperty -Name "CEIPEnable" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting" -Force | New-ItemProperty -Name "Disabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "LogonType" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" -Force | New-ItemProperty -Name "DCSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" -Force | New-ItemProperty -Name "ACSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Force | New-ItemProperty -Name "DCSettingIndex" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Force | New-ItemProperty -Name "ACSettingIndex" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "fAllowUnsolicited" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "fAllowToGetHelp" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Rpc" -Force | New-ItemProperty -Name "EnableAuthEpResolution" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Rpc" -Force | New-ItemProperty -Name "RestrictRemoteClients" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" -Force | New-ItemProperty -Name "DisableQueryRemoteServer" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" -Force | New-ItemProperty -Name "ScenarioExecutionEnabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\W32Time\TimeProviders\NtpClient" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\W32Time\TimeProviders\NtpServer" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Force | New-ItemProperty -Name "NoAutoplayfornonVolume" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | New-ItemProperty -Name "NoAutorun" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | New-ItemProperty -Name "NoDriveTypeAutoRun" -PropertyType DWord -Value "255" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVDiscoveryVolumeType" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVRecovery" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVManageDRA" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVRecoveryPassword" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVRecoveryKey" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVHideRecoveryPage" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVActiveDirectoryBackup" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVActiveDirectoryInfoToStore" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVRequireActiveDirectoryBackup" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVPassphrase" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVAllowUserCert" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVEnforceUserCert" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "UseEnhancedPin" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSRecovery" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSManageDRA" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSRecoveryPassword" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSRecoveryKey" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSHideRecoveryPage" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSActiveDirectoryBackup" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSActiveDirectoryInfoToStore" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSRequireActiveDirectoryBackup" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "MinimumPIN" -PropertyType DWord -Value "7" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "UseAdvancedStartup" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "EnableBDEWithNoTPM" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "UseTPM" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "UseTPMPIN" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "UseTPMKey" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "UseTPMKeyPIN" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVDiscoveryVolumeType" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVRecovery" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVManageDRA" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVRecoveryPassword" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVRecoveryKey" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVHideRecoveryPage" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVActiveDirectoryBackup" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVActiveDirectoryInfoToStore" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVRequireActiveDirectoryBackup" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVPassphrase" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVAllowUserCert" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVEnforceUserCert" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVDenyWriteAccess" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVDenyCrossOrg" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "EncryptionMethodNoDiffuser" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" -Force | New-ItemProperty -Name "DisablePasswordReveal" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Force | New-ItemProperty -Name "EnumerateAdministrators" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Sidebar" -Force | New-ItemProperty -Name "TurnOffSidebar" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Sidebar" -Force | New-ItemProperty -Name "TurnOffUserInstalledGadgets" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\EMET_Service" -Force | New-ItemProperty -Name "Start" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" -Force | New-ItemProperty -Name "AntiDetours" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" -Force | New-ItemProperty -Name "BannedFunctions" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" -Force | New-ItemProperty -Name "DeepHooks" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" -Force | New-ItemProperty -Name "ExploitAction" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Internet Explorer\iexplore.exe" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\7-Zip\7z.exe" -PropertyType String -Value "-EAF" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\7-Zip\7zFM.exe" -PropertyType String -Value "*-EAF" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Google\Chrome\Appliation\chrome.exe" -PropertyType String -Value "+EAF+ eaf_modules:chrome_child.dll" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Mozilla Firefox\firefox.exe" -PropertyType String -Value "+EAF+ eaf_modules:mozjs.dll;xul.dll" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Mozilla Firefox\plugin-container.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Foxit Reader\Foxit Reader.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Google\Google Talk\googletalk.exe" -PropertyType String -Value "-DEP" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\iTunes\iTunes.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Windows Live\Writer\WindowsLiveWriter.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Microsoft Lync\communicator.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\mIRC\mirc.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Opera\opera.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Windows Live\Photo Gallery\WLXPhotoGallery.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Adobe\Adobe Photoshop CS*\Photoshop.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Pidgin\pidgin.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\QuickTime\QuickTimePlayer.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Real\RealPlayer\realconverter.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Real\RealPlayer\realplay.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Safari\Safari.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\SkyDrive\SkyDrive.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Skype\Phone\Skype.exe" -PropertyType String -Value "-EAF" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Mozilla Thunderbird\thunderbird.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\WinRAR\unrar.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\VideoLAN\VLC\vlc.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Winamp\winamp.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Windows Media Player\wmplayer.exe" -PropertyType String -Value "-EAF -MandatoryASLR" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\WinRAR\rar.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\WinRAR\winrar.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\WinZip\winzip32.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\WinZip\winzip64.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\MSACCESS.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Adobe\Acrobat*\Acrobat\Acrobat.exe" -PropertyType String -Value "+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Adobe\*\Reader\AcroRd32.exe" -PropertyType String -Value "+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\EXCEL.exe" -PropertyType String -Value "+ASR asr_modules:flash*.ocx" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\INFOPATH.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Java\jre*\bin\java.exe" -PropertyType String -Value "-HeapSpray" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Java\jre*\bin\javaw.exe" -PropertyType String -Value "-HeapSpray" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Java\jre*\bin\javaws.exe" -PropertyType String -Value "-HeapSpray" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\LYNC.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\OUTLOOK.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\OIS.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\POWERPNT.exe" -PropertyType String -Value "+ASR asr_modules:flash*.ocx" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\PPTVIEW.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\MSPUB.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\VISIO.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\VPREVIEW.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\OFFICE1*\WINWORD.exe" -PropertyType String -Value "+ASR asr_modules:flash*.ocx" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" -Force | New-ItemProperty -Name "*\Windows NT\Accessories\wordpad.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" -Force | New-ItemProperty -Name "ASLR" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" -Force | New-ItemProperty -Name "DEP" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" -Force | New-ItemProperty -Name "SEHOP" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" -Force | New-ItemProperty -Name "Retention" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" -Force | New-ItemProperty -Name "MaxSize" -PropertyType DWord -Value "32768" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" -Force | New-ItemProperty -Name "Retention" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" -Force | New-ItemProperty -Name "MaxSize" -PropertyType DWord -Value "196608" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" -Force | New-ItemProperty -Name "Retention" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" -Force | New-ItemProperty -Name "MaxSize" -PropertyType DWord -Value "32768" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" -Force | New-ItemProperty -Name "Retention" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" -Force | New-ItemProperty -Name "MaxSize" -PropertyType DWord -Value "32768" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Force | New-ItemProperty -Name "NoDataExecutionPrevention" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" -Force | New-ItemProperty -Name "NoHeapTerminationOnCorruption" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | New-ItemProperty -Name "PreXPSP2ShellProtocolBehavior" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\HomeGroup" -Force | New-ItemProperty -Name "DisableHomeGroup" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors" -Force | New-ItemProperty -Name "DisableLocation" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "DisablePasswordSaving" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "fDisableCcm" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "fDisableCdm" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "fDisableLPT" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "fDisablePNPRedir" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "fPromptForPassword" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "fEncryptRPCTraffic" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "MinEncryptionLevel" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "MaxIdleTime" -PropertyType DWord -Value "900000" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "MaxDisconnectionTime" -PropertyType DWord -Value "60000" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "DeleteTempDirsOnExit" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" -Force | New-ItemProperty -Name "PerSessionTempDir" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds" -Force | New-ItemProperty -Name "DeleteEnclosureDownload" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Force | New-ItemProperty -Name "AllowIndexingEncryptedStoresOrItems" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows Defender\Spynet" -Force | New-ItemProperty -Name "SpynetReporting" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting\Consent" -Force | New-ItemProperty -Name "DefaultConsent" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Force | New-ItemProperty -Name "EnableUserControl" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Force | New-ItemProperty -Name "AlwaysInstallElevated" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Force | New-ItemProperty -Name "SafeForScripting" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force | New-ItemProperty -Name "EnableScriptBlockLogging" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" -Force | New-ItemProperty -Name "EnableTranscripting" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Force | New-ItemProperty -Name "AllowBasic" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Force | New-ItemProperty -Name "AllowUnencryptedTraffic" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" -Force | New-ItemProperty -Name "AllowDigest" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Force | New-ItemProperty -Name "AllowBasic" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Force | New-ItemProperty -Name "AllowUnencryptedTraffic" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Force | New-ItemProperty -Name "DisableRunAs" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" -Force | New-ItemProperty -Name "AllowRemoteShellAccess" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "NoAutoUpdate" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "ScheduledInstallDay" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "NoAUAsDefaultShutdownOption" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "NoAUShutdownOption" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "NoAutoRebootWithLoggedOnUsers" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "RescheduleWaitTimeEnabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | New-ItemProperty -Name "RescheduleWaitTime" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "ScreenSaveActive" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "SCRNSAVE.EXE" -PropertyType String -Value "scrnsave.scr" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "SCRNSAVE.EXE" -PropertyType String -Value "scrnsave.scr" -Force
New-Item -Path "HKU:\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "ScreenSaverIsSecure" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "ScreenSaveTimeOut" -PropertyType String -Value "900" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Force | New-ItemProperty -Name "ScreenSaveTimeOut" -PropertyType String -Value "900" -Force
New-Item -Path "HKU:\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Assistance\Client\1.0" -Force | New-ItemProperty -Name "NoImplicitFeedback" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Assistance\Client\1.0" -Force | New-ItemProperty -Name "NoImplicitFeedback" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\&amp;lt;SID&amp;gt;\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Force | New-ItemProperty -Name "SaveZoneInformation" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Force | New-ItemProperty -Name "ScanWithAntiVirus" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | New-ItemProperty -Name "NoInplaceSharing" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Installer" -Force | New-ItemProperty -Name "AlwaysInstallElevated" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Installer" -Force | New-ItemProperty -Name "AlwaysInstallElevated" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\WindowsMediaPlayer" -Force | New-ItemProperty -Name "PreventCodecDownload" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\WindowsMediaPlayer" -Force | New-ItemProperty -Name "PreventCodecDownload" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\InputPersonalization" -Force | New-ItemProperty -Name "AllowInputPersonalization" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force | New-ItemProperty -Name "ScreenSaverGracePeriod" -PropertyType String -Value "5" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netbt\Parameters" -Force | New-ItemProperty -Name "NodeType" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Force | New-ItemProperty -Name "EnableFontProviders" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Force | New-ItemProperty -Name "EnableCdp" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Force | New-ItemProperty -Name "DevicePKInitBehavior" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Force | New-ItemProperty -Name "DevicePKInitEnabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Control Panel\International" -Force | New-ItemProperty -Name "BlockUserInputMethodsForSignIn" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Force | New-ItemProperty -Name "BlockUserFromShowingAccountDetailsOnSignin" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Force | New-ItemProperty -Name "DontEnumerateConnectedUsers" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" -Force | New-ItemProperty -Name "DisableLockScreenAppNotifications" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Force | New-ItemProperty -Name "DCSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Force | New-ItemProperty -Name "ACSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Force | New-ItemProperty -Name "DCSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AdvertisingInfo" -Force | New-ItemProperty -Name "DisabledByGroupPolicy" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\W32Time\TimeProviders\NtpClient" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\W32Time\TimeProviders\NtpServer" -Force | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" -Force | New-ItemProperty -Name "AllowSharedLocalAppData" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessAccountInfo" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessCallHistory" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessContacts" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessEmail" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessLocation" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessMessaging" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessMotion" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessCalendar" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessCamera" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessMicrophone" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessTrustedDevices" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessRadios" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsSyncWithDevices" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessPhone" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Force | New-ItemProperty -Name "LetAppsAccessNotifications" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "BlockHostedAppAccessWinRT" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Force | New-ItemProperty -Name "restrictremotesam" -PropertyType String -Value "O:BAG:BAD:(A;;RC;;;BA)" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVHardwareEncryption" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVAllowSoftwareEncryptionFailover" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVRestrictHardwareEncryptionAlgorithms" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "FDVAllowedHardwareEncryptionAlgorithms" -PropertyType reg_expand_sz -Value "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSHardwareEncryption" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSAllowSoftwareEncryptionFailover" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSRestrictHardwareEncryptionAlgorithms" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSAllowedHardwareEncryptionAlgorithms" -PropertyType reg_expand_sz -Value "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVHardwareEncryption" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVAllowSoftwareEncryptionFailover" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVRestrictHardwareEncryptionAlgorithms" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "RDVAllowedHardwareEncryptionAlgorithms" -PropertyType reg_expand_sz -Value "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Camera" -Force | New-ItemProperty -Name "AllowCamera" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Connect" -Force | New-ItemProperty -Name "RequirePinForPairing" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Force | New-ItemProperty -Name "AllowTelemetry" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PreviewBuilds" -Force | New-ItemProperty -Name "EnableConfigFlighting" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Force | New-ItemProperty -Name "DoNotShowFeedbackNotifications" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PreviewBuilds" -Force | New-ItemProperty -Name "AllowBuildPreview" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeliveryOptimization" -Force | New-ItemProperty -Name "DODownloadMode" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors" -Force | New-ItemProperty -Name "DisableWindowsLocationProvider" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Extensions" -Force | New-ItemProperty -Name "ExtensionsEnabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" -Force | New-ItemProperty -Name "AllowInPrivate" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" -Force | New-ItemProperty -Name "Cookies" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" -Force | New-ItemProperty -Name "AllowPopups" -PropertyType String -Value "yes" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\SearchScopes" -Force | New-ItemProperty -Name "ShowSearchSuggestionsGlobal" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" -Force | New-ItemProperty -Name "PreventAccessToAboutFlagsInMicrosoftEdge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" -Force | New-ItemProperty -Name "HideLocalHostIP" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" -Force | New-ItemProperty -Name "DisableFileSyncNGSC" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Force | New-ItemProperty -Name "AllowCortana" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Force | New-ItemProperty -Name "AllowCortanaAboveLock" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Force | New-ItemProperty -Name "AllowSearchToUseLocation" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Force | New-ItemProperty -Name "NoGenTicket" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore" -Force | New-ItemProperty -Name "DisableStoreApps" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore" -Force | New-ItemProperty -Name "AutoDownload" -PropertyType DWord -Value "4" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore" -Force | New-ItemProperty -Name "DisableOSUpgrade" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore" -Force | New-ItemProperty -Name "RemoveWindowsStore" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Reporting" -Force | New-ItemProperty -Name "DisableGenericReports" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\GameDVR" -Force | New-ItemProperty -Name "AllowGameDVR" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" -Force | New-ItemProperty -Name "AllowSuggestedAppsInWindowsInkWorkspace" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" -Force | New-ItemProperty -Name "AllowWindowsInkWorkspace" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" -Force | New-ItemProperty -Name "AllowAutoConfig" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Force | New-ItemProperty -Name "BranchReadinessLevel" -PropertyType DWord -Value "32" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Force | New-ItemProperty -Name "DeferFeatureUpdatesPeriodInDays" -PropertyType DWord -Value "180" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Force | New-ItemProperty -Name "DeferFeatureUpdates" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Force | New-ItemProperty -Name "DeferQualityUpdates" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" -Force | New-ItemProperty -Name "DeferQualityUpdatesPeriodInDays" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Assistance\Client\1.0" -Force | New-ItemProperty -Name "NoImplicitFeedback" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Force | New-ItemProperty -Name "SaveZoneInformation" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Force | New-ItemProperty -Name "SaveZoneInformation" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Force | New-ItemProperty -Name "ScanWithAntiVirus" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" -Force | New-ItemProperty -Name "ConfigureWindowsSpotlight" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" -Force | New-ItemProperty -Name "ConfigureWindowsSpotlight" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" -Force | New-ItemProperty -Name "DisableThirdPartySuggestions" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" -Force | New-ItemProperty -Name "DisableThirdPartySuggestions" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Force | New-ItemProperty -Name "NoInplaceSharing" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" -Force | New-ItemProperty -Name "OSPassphrase" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" -Force | New-ItemProperty -Name "DisableWindowsSpotlightFeatures" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" -Force | New-ItemProperty -Name "DisableWindowsSpotlightFeatures" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Force | New-ItemProperty -Name "fDenyTSConnections" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Force | New-ItemProperty -Name "ValidateAdminCodeSignatures" -PropertyType DWord -Value "0" -Force

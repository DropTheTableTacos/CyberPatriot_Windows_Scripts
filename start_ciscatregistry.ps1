# CIS-CAT Massive Registry Script

New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "LimitBlankPasswordUse" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "scenoapplylegacyauditpolicy" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "crashonauditfail" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" | New-ItemProperty -Name "AllocateDASD" -PropertyType String -Value "2" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" | New-ItemProperty -Name "requiresignorseal" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" | New-ItemProperty -Name "sealsecurechannel" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" | New-ItemProperty -Name "signsecurechannel" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" | New-ItemProperty -Name "disablepasswordchange" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters" | New-ItemProperty -Name "requirestrongkey" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "DontDisplayLastUserName" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "DisableCAD" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "LegalNoticeText" -PropertyType String -Value "a" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "LegalNoticeCaption" -PropertyType String -Value "a" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" | New-ItemProperty -Name "cachedlogonscount" -PropertyType String -Value "4" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" | New-ItemProperty -Name "scremoveoption" -PropertyType String -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" | New-ItemProperty -Name "RequireSecuritySignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" | New-ItemProperty -Name "EnableSecuritySignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" | New-ItemProperty -Name "EnablePlainTextPassword" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" | New-ItemProperty -Name "autodisconnect" -PropertyType DWord -Value "15" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" | New-ItemProperty -Name "requiresecuritysignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" | New-ItemProperty -Name "enablesecuritysignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" | New-ItemProperty -Name "enableforcedlogoff" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" | New-ItemProperty -Name "SMBServerNameHardeningLevel" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" | New-ItemProperty -Name "requiresecuritysignature" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "RestrictAnonymousSAM" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "RestrictAnonymous" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "disabledomaincreds" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "EveryoneIncludesAnonymous" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters" | New-ItemProperty -Name "restrictnullsessaccess" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "ForceGuest" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "UseMachineId" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" | New-ItemProperty -Name "allownullsessionfallback" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\pku2u" | New-ItemProperty -Name "AllowOnlineID" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Kerberos\Parameters" | New-ItemProperty -Name "SupportedEncryptionTypes" -PropertyType DWord -Value "2147483644" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "NoLMHash" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "LmCompatibilityLevel" -PropertyType DWord -Value "5" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\LDAP" | New-ItemProperty -Name "LDAPClientIntegrity" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" | New-ItemProperty -Name "NTLMMinClientSec" -PropertyType DWord -Value "537395200" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa\MSV1_0" | New-ItemProperty -Name "NTLMMinServerSec" -PropertyType DWord -Value "537395200" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Cryptography" | New-ItemProperty -Name "ForceKeyProtection" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Kernel" | New-ItemProperty -Name "ObCaseInsensitive" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Subsystems" | New-ItemProperty -Name "Optional" -PropertyType reg_multi_sz -Value " " -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "FilterAdministratorToken" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "EnableUIADesktopToggle" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "ConsentPromptBehaviorAdmin" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "ConsentPromptBehaviorUser" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "EnableInstallerDetection" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "EnableSecureUIAPaths" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "EnableLUA" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "PromptOnSecureDesktop" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "EnableVirtualization" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "FilterAdministratorToken" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" | New-ItemProperty -Name "AllowLocalPolicyMerge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" | New-ItemProperty -Name "AllowLocalIPsecPolicyMerge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" | New-ItemProperty -Name "LogFilePath" -PropertyType String -Value "%systemroot^%\System32\logfiles\firewall\domainfw.log" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" | New-ItemProperty -Name "AllowLocalPolicyMerge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" | New-ItemProperty -Name "AllowLocalIPsecPolicyMerge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" | New-ItemProperty -Name "LogFilePath" -PropertyType String -Value "%systemroot^%\System32\logfiles\firewall\privatefw.log" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PublicProfile" | New-ItemProperty -Name "DisableNotifications" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" | New-ItemProperty -Name "LogFilePath" -PropertyType String -Value "%systemroot^%\System32\logfiles\firewall\publicfw.log" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D-087DE603E3EA}" | New-ItemProperty -Name "DllName" -PropertyType String -Value "C:\Program Files\LAPS\CSE\AdmPwd.dll" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" | New-ItemProperty -Name "PwdExpirationProtectionEnabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" | New-ItemProperty -Name "AdmPwdEnabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" | New-ItemProperty -Name "PasswordComplexity" -PropertyType DWord -Value "4" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" | New-ItemProperty -Name "PasswordLength" -PropertyType DWord -Value "15" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft Services\AdmPwd" | New-ItemProperty -Name "PasswordAgeDays" -PropertyType DWord -Value "30" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" | New-ItemProperty -Name "AutoAdminLogon" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" | New-ItemProperty -Name "DisableIPSourceRouting" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" | New-ItemProperty -Name "DisableIPSourceRouting" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Rasman\Parameters" | New-ItemProperty -Name "disablesavepassword" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" | New-ItemProperty -Name "EnableICMPRedirect" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" | New-ItemProperty -Name "KeepAliveTime" -PropertyType DWord -Value "300000" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\NetBT\Parameters" | New-ItemProperty -Name "nonamereleaseondemand" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" | New-ItemProperty -Name "PerformRouterDiscovery" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Session Manager" | New-ItemProperty -Name "SafeDllSearchMode" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" | New-ItemProperty -Name "ScreenSaverGracePeriod" -PropertyType DWord -Value "5" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" | New-ItemProperty -Name "tcpmaxdataretransmissions" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters" | New-ItemProperty -Name "tcpmaxdataretransmissions" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Eventlog\Security" | New-ItemProperty -Name "WarningLevel" -PropertyType DWord -Value "90" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" | New-ItemProperty -Name "AllowLLTDIOOndomain" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" | New-ItemProperty -Name "AllowLLTDIOOnPublicNet" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" | New-ItemProperty -Name "EnableLLTDIO" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" | New-ItemProperty -Name "ProhibitLLTDIOOnPrivateNet" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" | New-ItemProperty -Name "AllowRspndrOnDomain" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" | New-ItemProperty -Name "AllowRspndrOnPublicNet" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" | New-ItemProperty -Name "EnableRspndr" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LLTD" | New-ItemProperty -Name "ProhibitRspndrOnPrivateNet" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Peernet" | New-ItemProperty -Name "Disabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" | New-ItemProperty -Name "NC_AllowNetBridge_NLA" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Network Connections" | New-ItemProperty -Name "NC_StdDomainUserSetLocation" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" | New-ItemProperty -Name "\\*\SYSVOL" -PropertyType String -Value "RequireMutualAuthentication=1, RequireIntegrity=1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" | New-ItemProperty -Name "DisabledComponents" -PropertyType DWord -Value "255" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" | New-ItemProperty -Name "EnableRegistrars" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" | New-ItemProperty -Name "DisableUPnPRegistrar" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" | New-ItemProperty -Name "DisableInBand802DOT11Registrar" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" | New-ItemProperty -Name "DisableFlashConfigRegistrar" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\Registrars" | New-ItemProperty -Name "DisableWPDRegistrar" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WCN\UI" | New-ItemProperty -Name "DisableWcnUi" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" | New-ItemProperty -Name "fMinimizeConnections" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" | New-ItemProperty -Name "fBlockNonDomain" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WcmSvc\wifinetworkmanager\config" | New-ItemProperty -Name "AutoConnectAllowedOEM" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "LocalAccountTokenFilterPolicy" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\SecurityProviders\WDigest" | New-ItemProperty -Name "UseLogonCredential" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit" | New-ItemProperty -Name "ProcessCreationIncludeCmdLine_Enabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" | New-ItemProperty -Name "DenyDeviceIDs" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" | New-ItemProperty -Name "DenyDeviceIDsRetroactive" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" | New-ItemProperty -Name "DenyDeviceClasses" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" | New-ItemProperty -Name "DenyDeviceClassesRetroactive" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Policies\EarlyLaunch" | New-ItemProperty -Name "DriverLoadPolicy" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" | New-ItemProperty -Name "NoBackgroundPolicy" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" | New-ItemProperty -Name "NoGPOListChanges" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" | New-ItemProperty -Name "NoUseStoreOpenWith" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" | New-ItemProperty -Name "DisableWebPnPDownload" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\TabletPC" | New-ItemProperty -Name "PreventHandwritingDataSharing" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\HandwritingErrorReports" | New-ItemProperty -Name "PreventHandwritingErrorReports" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Internet Connection Wizard" | New-ItemProperty -Name "ExitOnMSICW" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | New-ItemProperty -Name "NoWebServices" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Printers" | New-ItemProperty -Name "DisableHTTPPrinting" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Registration Wizard Control" | New-ItemProperty -Name "NoRegistration" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\SearchCompanion" | New-ItemProperty -Name "DisableContentFileUpdates" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | New-ItemProperty -Name "NoOnlinePrintsWizard" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | New-ItemProperty -Name "NoPublishingWizard" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Messenger\Client" | New-ItemProperty -Name "CEIP" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\SQMClient\Windows" | New-ItemProperty -Name "CEIPEnable" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting" | New-ItemProperty -Name "Disabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "LogonType" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" | New-ItemProperty -Name "DCSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" | New-ItemProperty -Name "ACSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" | New-ItemProperty -Name "DCSettingIndex" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" | New-ItemProperty -Name "ACSettingIndex" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "fAllowUnsolicited" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "fAllowToGetHelp" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Rpc" | New-ItemProperty -Name "EnableAuthEpResolution" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Rpc" | New-ItemProperty -Name "RestrictRemoteClients" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" | New-ItemProperty -Name "DisableQueryRemoteServer" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" | New-ItemProperty -Name "ScenarioExecutionEnabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\W32Time\TimeProviders\NtpClient" | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\W32Time\TimeProviders\NtpServer" | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" | New-ItemProperty -Name "NoAutoplayfornonVolume" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | New-ItemProperty -Name "NoAutorun" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | New-ItemProperty -Name "NoDriveTypeAutoRun" -PropertyType DWord -Value "255" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVDiscoveryVolumeType" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVRecovery" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVManageDRA" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVRecoveryPassword" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVRecoveryKey" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVHideRecoveryPage" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVActiveDirectoryBackup" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVActiveDirectoryInfoToStore" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVRequireActiveDirectoryBackup" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVPassphrase" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVAllowUserCert" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVEnforceUserCert" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "UseEnhancedPin" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSRecovery" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSManageDRA" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSRecoveryPassword" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSRecoveryKey" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSHideRecoveryPage" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSActiveDirectoryBackup" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSActiveDirectoryInfoToStore" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSRequireActiveDirectoryBackup" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "MinimumPIN" -PropertyType DWord -Value "7" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "UseAdvancedStartup" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "EnableBDEWithNoTPM" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "UseTPM" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "UseTPMPIN" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "UseTPMKey" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "UseTPMKeyPIN" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVDiscoveryVolumeType" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVRecovery" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVManageDRA" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVRecoveryPassword" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVRecoveryKey" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVHideRecoveryPage" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVActiveDirectoryBackup" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVActiveDirectoryInfoToStore" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVRequireActiveDirectoryBackup" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVPassphrase" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVAllowUserCert" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVEnforceUserCert" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVDenyWriteAccess" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVDenyCrossOrg" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "EncryptionMethodNoDiffuser" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CredUI" | New-ItemProperty -Name "DisablePasswordReveal" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI" | New-ItemProperty -Name "EnumerateAdministrators" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Sidebar" | New-ItemProperty -Name "TurnOffSidebar" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Sidebar" | New-ItemProperty -Name "TurnOffUserInstalledGadgets" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\EMET_Service" | New-ItemProperty -Name "Start" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" | New-ItemProperty -Name "AntiDetours" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" | New-ItemProperty -Name "BannedFunctions" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" | New-ItemProperty -Name "DeepHooks" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" | New-ItemProperty -Name "ExploitAction" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Internet Explorer\iexplore.exe" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\7-Zip\7z.exe" -PropertyType String -Value "-EAF" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\7-Zip\7zFM.exe" -PropertyType String -Value "*-EAF" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Google\Chrome\Appliation\chrome.exe" -PropertyType String -Value "+EAF+ eaf_modules:chrome_child.dll" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Mozilla Firefox\firefox.exe" -PropertyType String -Value "+EAF+ eaf_modules:mozjs.dll;xul.dll" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Mozilla Firefox\plugin-container.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Foxit Reader\Foxit Reader.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Google\Google Talk\googletalk.exe" -PropertyType String -Value "-DEP" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\iTunes\iTunes.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Windows Live\Writer\WindowsLiveWriter.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Microsoft Lync\communicator.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\mIRC\mirc.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Opera\opera.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Windows Live\Photo Gallery\WLXPhotoGallery.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Adobe\Adobe Photoshop CS*\Photoshop.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Pidgin\pidgin.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\QuickTime\QuickTimePlayer.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Real\RealPlayer\realconverter.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Real\RealPlayer\realplay.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Safari\Safari.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\SkyDrive\SkyDrive.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Skype\Phone\Skype.exe" -PropertyType String -Value "-EAF" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Mozilla Thunderbird\thunderbird.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\WinRAR\unrar.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\VideoLAN\VLC\vlc.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Winamp\winamp.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Windows Media Player\wmplayer.exe" -PropertyType String -Value "-EAF -MandatoryASLR" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\WinRAR\rar.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\WinRAR\winrar.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\WinZip\winzip32.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\WinZip\winzip64.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\MSACCESS.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Adobe\Acrobat*\Acrobat\Acrobat.exe" -PropertyType String -Value "+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Adobe\*\Reader\AcroRd32.exe" -PropertyType String -Value "+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\EXCEL.exe" -PropertyType String -Value "+ASR asr_modules:flash*.ocx" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\INFOPATH.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Java\jre*\bin\java.exe" -PropertyType String -Value "-HeapSpray" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Java\jre*\bin\javaw.exe" -PropertyType String -Value "-HeapSpray" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Java\jre*\bin\javaws.exe" -PropertyType String -Value "-HeapSpray" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\LYNC.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\OUTLOOK.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\OIS.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\POWERPNT.exe" -PropertyType String -Value "+ASR asr_modules:flash*.ocx" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\PPTVIEW.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\MSPUB.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\VISIO.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\VPREVIEW.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\OFFICE1*\WINWORD.exe" -PropertyType String -Value "+ASR asr_modules:flash*.ocx" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\Defaults" | New-ItemProperty -Name "*\Windows NT\Accessories\wordpad.exe" -PropertyType String -Value " " -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" | New-ItemProperty -Name "ASLR" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" | New-ItemProperty -Name "DEP" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\EMET\SysSettings" | New-ItemProperty -Name "SEHOP" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" | New-ItemProperty -Name "Retention" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application" | New-ItemProperty -Name "MaxSize" -PropertyType DWord -Value "32768" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" | New-ItemProperty -Name "Retention" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security" | New-ItemProperty -Name "MaxSize" -PropertyType DWord -Value "196608" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" | New-ItemProperty -Name "Retention" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Setup" | New-ItemProperty -Name "MaxSize" -PropertyType DWord -Value "32768" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" | New-ItemProperty -Name "Retention" -PropertyType String -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\EventLog\System" | New-ItemProperty -Name "MaxSize" -PropertyType DWord -Value "32768" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" | New-ItemProperty -Name "NoDataExecutionPrevention" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Explorer" | New-ItemProperty -Name "NoHeapTerminationOnCorruption" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | New-ItemProperty -Name "PreXPSP2ShellProtocolBehavior" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\HomeGroup" | New-ItemProperty -Name "DisableHomeGroup" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors" | New-ItemProperty -Name "DisableLocation" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "DisablePasswordSaving" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "fDisableCcm" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "fDisableCdm" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "fDisableLPT" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "fDisablePNPRedir" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "fPromptForPassword" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "fEncryptRPCTraffic" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "MinEncryptionLevel" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "MaxIdleTime" -PropertyType DWord -Value "900000" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "MaxDisconnectionTime" -PropertyType DWord -Value "60000" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "DeleteTempDirsOnExit" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services" | New-ItemProperty -Name "PerSessionTempDir" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds" | New-ItemProperty -Name "DeleteEnclosureDownload" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" | New-ItemProperty -Name "AllowIndexingEncryptedStoresOrItems" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows Defender\Spynet" | New-ItemProperty -Name "SpynetReporting" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting\Consent" | New-ItemProperty -Name "DefaultConsent" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" | New-ItemProperty -Name "EnableUserControl" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" | New-ItemProperty -Name "AlwaysInstallElevated" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" | New-ItemProperty -Name "SafeForScripting" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" | New-ItemProperty -Name "EnableScriptBlockLogging" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription" | New-ItemProperty -Name "EnableTranscripting" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" | New-ItemProperty -Name "AllowBasic" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" | New-ItemProperty -Name "AllowUnencryptedTraffic" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Client" | New-ItemProperty -Name "AllowDigest" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" | New-ItemProperty -Name "AllowBasic" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" | New-ItemProperty -Name "AllowUnencryptedTraffic" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" | New-ItemProperty -Name "DisableRunAs" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" | New-ItemProperty -Name "AllowRemoteShellAccess" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" | New-ItemProperty -Name "NoAutoUpdate" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" | New-ItemProperty -Name "ScheduledInstallDay" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" | New-ItemProperty -Name "NoAUAsDefaultShutdownOption" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" | New-ItemProperty -Name "NoAUShutdownOption" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" | New-ItemProperty -Name "NoAutoRebootWithLoggedOnUsers" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" | New-ItemProperty -Name "RescheduleWaitTimeEnabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" | New-ItemProperty -Name "RescheduleWaitTime" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Windows\Control Panel\Desktop" | New-ItemProperty -Name "ScreenSaveActive" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Control Panel\Desktop" | New-ItemProperty -Name "SCRNSAVE.EXE" -PropertyType String -Value "scrnsave.scr" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Control Panel\Desktop" | New-ItemProperty -Name "SCRNSAVE.EXE" -PropertyType String -Value "scrnsave.scr" -Force
New-Item -Path "HKU:\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Windows\Control Panel\Desktop" | New-ItemProperty -Name "ScreenSaverIsSecure" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Control Panel\Desktop" | New-ItemProperty -Name "ScreenSaveTimeOut" -PropertyType String -Value "900" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Control Panel\Desktop" | New-ItemProperty -Name "ScreenSaveTimeOut" -PropertyType String -Value "900" -Force
New-Item -Path "HKU:\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Assistance\Client\1.0" | New-ItemProperty -Name "NoImplicitFeedback" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Assistance\Client\1.0" | New-ItemProperty -Name "NoImplicitFeedback" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\&amp;lt;SID&amp;gt;\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" | New-ItemProperty -Name "SaveZoneInformation" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" | New-ItemProperty -Name "ScanWithAntiVirus" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | New-ItemProperty -Name "NoInplaceSharing" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Installer" | New-ItemProperty -Name "AlwaysInstallElevated" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Installer" | New-ItemProperty -Name "AlwaysInstallElevated" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\WindowsMediaPlayer" | New-ItemProperty -Name "PreventCodecDownload" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\WindowsMediaPlayer" | New-ItemProperty -Name "PreventCodecDownload" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\InputPersonalization" | New-ItemProperty -Name "AllowInputPersonalization" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" | New-ItemProperty -Name "ScreenSaverGracePeriod" -PropertyType String -Value "5" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Services\Netbt\Parameters" | New-ItemProperty -Name "NodeType" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" | New-ItemProperty -Name "EnableFontProviders" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" | New-ItemProperty -Name "EnableCdp" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" | New-ItemProperty -Name "DevicePKInitBehavior" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" | New-ItemProperty -Name "DevicePKInitEnabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Control Panel\International" | New-ItemProperty -Name "BlockUserInputMethodsForSignIn" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" | New-ItemProperty -Name "BlockUserFromShowingAccountDetailsOnSignin" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" | New-ItemProperty -Name "DontEnumerateConnectedUsers" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\System" | New-ItemProperty -Name "DisableLockScreenAppNotifications" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" | New-ItemProperty -Name "DCSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" | New-ItemProperty -Name "ACSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" | New-ItemProperty -Name "DCSettingIndex" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AdvertisingInfo" | New-ItemProperty -Name "DisabledByGroupPolicy" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\W32Time\TimeProviders\NtpClient" | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\W32Time\TimeProviders\NtpServer" | New-ItemProperty -Name "Enabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" | New-ItemProperty -Name "AllowSharedLocalAppData" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessAccountInfo" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessCallHistory" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessContacts" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessEmail" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessLocation" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessMessaging" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessMotion" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessCalendar" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessCamera" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessMicrophone" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessTrustedDevices" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessRadios" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsSyncWithDevices" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessPhone" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" | New-ItemProperty -Name "LetAppsAccessNotifications" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "BlockHostedAppAccessWinRT" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Lsa" | New-ItemProperty -Name "restrictremotesam" -PropertyType String -Value "O:BAG:BAD:(A;;RC;;;BA)" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVHardwareEncryption" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVAllowSoftwareEncryptionFailover" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVRestrictHardwareEncryptionAlgorithms" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "FDVAllowedHardwareEncryptionAlgorithms" -PropertyType reg_expand_sz -Value "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSHardwareEncryption" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSAllowSoftwareEncryptionFailover" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSRestrictHardwareEncryptionAlgorithms" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSAllowedHardwareEncryptionAlgorithms" -PropertyType reg_expand_sz -Value "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVHardwareEncryption" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVAllowSoftwareEncryptionFailover" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVRestrictHardwareEncryptionAlgorithms" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "RDVAllowedHardwareEncryptionAlgorithms" -PropertyType reg_expand_sz -Value "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Camera" | New-ItemProperty -Name "AllowCamera" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Connect" | New-ItemProperty -Name "RequirePinForPairing" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" | New-ItemProperty -Name "AllowTelemetry" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PreviewBuilds" | New-ItemProperty -Name "EnableConfigFlighting" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" | New-ItemProperty -Name "DoNotShowFeedbackNotifications" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\PreviewBuilds" | New-ItemProperty -Name "AllowBuildPreview" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\DeliveryOptimization" | New-ItemProperty -Name "DODownloadMode" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\LocationAndSensors" | New-ItemProperty -Name "DisableWindowsLocationProvider" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Extensions" | New-ItemProperty -Name "ExtensionsEnabled" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" | New-ItemProperty -Name "AllowInPrivate" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" | New-ItemProperty -Name "Cookies" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" | New-ItemProperty -Name "AllowPopups" -PropertyType String -Value "yes" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\SearchScopes" | New-ItemProperty -Name "ShowSearchSuggestionsGlobal" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" | New-ItemProperty -Name "PreventAccessToAboutFlagsInMicrosoftEdge" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\MicrosoftEdge\Main" | New-ItemProperty -Name "HideLocalHostIP" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\OneDrive" | New-ItemProperty -Name "DisableFileSyncNGSC" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" | New-ItemProperty -Name "AllowCortana" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" | New-ItemProperty -Name "AllowCortanaAboveLock" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" | New-ItemProperty -Name "AllowSearchToUseLocation" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" | New-ItemProperty -Name "NoGenTicket" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore" | New-ItemProperty -Name "DisableStoreApps" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore" | New-ItemProperty -Name "AutoDownload" -PropertyType DWord -Value "4" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore" | New-ItemProperty -Name "DisableOSUpgrade" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsStore" | New-ItemProperty -Name "RemoveWindowsStore" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Reporting" | New-ItemProperty -Name "DisableGenericReports" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\GameDVR" | New-ItemProperty -Name "AllowGameDVR" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" | New-ItemProperty -Name "AllowSuggestedAppsInWindowsInkWorkspace" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\WindowsInkWorkspace" | New-ItemProperty -Name "AllowWindowsInkWorkspace" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WinRM\Service" | New-ItemProperty -Name "AllowAutoConfig" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" | New-ItemProperty -Name "BranchReadinessLevel" -PropertyType DWord -Value "32" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" | New-ItemProperty -Name "DeferFeatureUpdatesPeriodInDays" -PropertyType DWord -Value "180" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" | New-ItemProperty -Name "DeferFeatureUpdates" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" | New-ItemProperty -Name "DeferQualityUpdates" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate" | New-ItemProperty -Name "DeferQualityUpdatesPeriodInDays" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Assistance\Client\1.0" | New-ItemProperty -Name "NoImplicitFeedback" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" | New-ItemProperty -Name "SaveZoneInformation" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" | New-ItemProperty -Name "SaveZoneInformation" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" | New-ItemProperty -Name "ScanWithAntiVirus" -PropertyType DWord -Value "3" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" | New-ItemProperty -Name "ConfigureWindowsSpotlight" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" | New-ItemProperty -Name "ConfigureWindowsSpotlight" -PropertyType DWord -Value "2" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" | New-ItemProperty -Name "DisableThirdPartySuggestions" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" | New-ItemProperty -Name "DisableThirdPartySuggestions" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | New-ItemProperty -Name "NoInplaceSharing" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\Software\Policies\Microsoft\FVE" | New-ItemProperty -Name "OSPassphrase" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKU:\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" | New-ItemProperty -Name "DisableWindowsSpotlightFeatures" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKU:\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" | New-ItemProperty -Name "DisableWindowsSpotlightFeatures" -PropertyType DWord -Value "1" -Force
New-Item -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" | New-ItemProperty -Name "fDenyTSConnections" -PropertyType DWord -Value "0" -Force
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" | New-ItemProperty -Name "ValidateAdminCodeSignatures" -PropertyType DWord -Value "0" -Force

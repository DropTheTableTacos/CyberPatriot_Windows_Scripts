# Massive Registry Script

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

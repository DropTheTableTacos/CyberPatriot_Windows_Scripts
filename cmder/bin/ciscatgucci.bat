@echo off

:: The Tings
cls

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "scenoapplylegacyauditpolicy" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "crashonauditfail" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AllocateDASD" /t reg_sz /d "2" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" -Name "requiresignorseal" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" -Name "sealsecurechannel" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" -Name "signsecurechannel" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" -Name "disablepasswordchange" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" -Name "requirestrongkey" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayLastUserName" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LegalNoticeText" /t reg_sz /d "a" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LegalNoticeCaption" /t reg_sz /d "a" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "cachedlogonscount" /t reg_sz /d "4" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "scremoveoption" /t reg_sz /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "RequireSecuritySignature" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "EnableSecuritySignature" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" -Name "EnablePlainTextPassword" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "autodisconnect" /t reg_dword /d "15" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "requiresecuritysignature" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "enablesecuritysignature" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "enableforcedlogoff" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "SMBServerNameHardeningLevel" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "requiresecuritysignature" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "RestrictAnonymousSAM" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "RestrictAnonymous" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "disabledomaincreds" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "EveryoneIncludesAnonymous" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "restrictnullsessaccess" /t reg_dword /d "1" /f

reg del "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" -Name "NullSessionShares" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "ForceGuest" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "UseMachineId" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0" -Name "allownullsessionfallback" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa\pku2u" -Name "AllowOnlineID" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Kerberos\Parameters" -Name "SupportedEncryptionTypes" /t reg_dword /d "2147483644" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "NoLMHash" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "LmCompatibilityLevel" /t reg_dword /d "5" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\LDAP" -Name "LDAPClientIntegrity" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NTLMMinClientSec" /t reg_dword /d "537395200" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NTLMMinServerSec" /t reg_dword /d "537395200" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Cryptography" -Name "ForceKeyProtection" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Session Manager\Kernel" -Name "ObCaseInsensitive" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Session Manager\Subsystems" -Name "Optional" /t reg_multi_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "FilterAdministratorToken" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableUIADesktopToggle" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableInstallerDetection" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableSecureUIAPaths" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableVirtualization" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "FilterAdministratorToken" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" -Name "AllowLocalPolicyMerge" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" -Name "AllowLocalIPsecPolicyMerge" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" -Name "LogFilePath" /t reg_sz /d "%systemroot^%\System32\logfiles\firewall\domainfw.log" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Name "AllowLocalPolicyMerge" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" -Name "AllowLocalIPsecPolicyMerge" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" -Name "LogFilePath" /t reg_sz /d "%systemroot^%\System32\logfiles\firewall\privatefw.log" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsFirewall\PublicProfile" -Name "DisableNotifications" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" -Name "LogFilePath" /t reg_sz /d "%systemroot^%\System32\logfiles\firewall\publicfw.log" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D-087DE603E3EA}" -Name "DllName" /t reg_sz /d "C:\Program Files\LAPS\CSE\AdmPwd.dll" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft Services\AdmPwd" -Name "PwdExpirationProtectionEnabled" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft Services\AdmPwd" -Name "AdmPwdEnabled" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft Services\AdmPwd" -Name "PasswordComplexity" /t reg_dword /d "4" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft Services\AdmPwd" -Name "PasswordLength" /t reg_dword /d "15" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft Services\AdmPwd" -Name "PasswordAgeDays" /t reg_dword /d "30" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" /t reg_sz /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" -Name "DisableIPSourceRouting" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "DisableIPSourceRouting" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Rasman\Parameters" -Name "disablesavepassword" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "EnableICMPRedirect" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "KeepAliveTime" /t reg_dword /d "300000" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\NetBT\Parameters" -Name "nonamereleaseondemand" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "PerformRouterDiscovery" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Session Manager" -Name "SafeDllSearchMode" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "ScreenSaverGracePeriod" /t reg_dword /d "5" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" -Name "tcpmaxdataretransmissions" /t reg_dword /d "3" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" -Name "tcpmaxdataretransmissions" /t reg_dword /d "3" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Eventlog\Security" -Name "WarningLevel" /t reg_dword /d "90" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LLTD" -Name "AllowLLTDIOOndomain" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LLTD" -Name "AllowLLTDIOOnPublicNet" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LLTD" -Name "EnableLLTDIO" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LLTD" -Name "ProhibitLLTDIOOnPrivateNet" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LLTD" -Name "AllowRspndrOnDomain" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LLTD" -Name "AllowRspndrOnPublicNet" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LLTD" -Name "EnableRspndr" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LLTD" -Name "ProhibitRspndrOnPrivateNet" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Peernet" -Name "Disabled" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Network Connections" -Name "NC_AllowNetBridge_NLA" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Network Connections" -Name "NC_StdDomainUserSetLocation" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Name "\\*\SYSVOL" /t reg_sz /d "RequireMutualAuthentication=1, RequireIntegrity=1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" -Name "DisabledComponents" /t reg_dword /d "255" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" -Name "EnableRegistrars" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableUPnPRegistrar" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableInBand802DOT11Registrar" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableFlashConfigRegistrar" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" -Name "DisableWPDRegistrar" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WCN\UI" -Name "DisableWcnUi" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fMinimizeConnections" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" -Name "fBlockNonDomain" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WcmSvc\wifinetworkmanager\config" -Name "AutoConnectAllowedOEM" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\SecurityProviders\WDigest" -Name "UseLogonCredential" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -Name "ProcessCreationIncludeCmdLine_Enabled" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name "DenyDeviceIDs" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name "DenyDeviceIDsRetroactive" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name "DenyDeviceClasses" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -Name "DenyDeviceClassesRetroactive" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Policies\EarlyLaunch" -Name "DriverLoadPolicy" /t reg_dword /d "3" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name "NoBackgroundPolicy" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" -Name "NoGPOListChanges" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Explorer" -Name "NoUseStoreOpenWith" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Printers" -Name "DisableWebPnPDownload" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\TabletPC" -Name "PreventHandwritingDataSharing" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" -Name "PreventHandwritingErrorReports" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Internet Connection Wizard" -Name "ExitOnMSICW" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoWebServices" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Printers" -Name "DisableHTTPPrinting" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Registration Wizard Control" -Name "NoRegistration" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\SearchCompanion" -Name "DisableContentFileUpdates" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoOnlinePrintsWizard" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoPublishingWizard" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Messenger\Client" -Name "CEIP" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\SQMClient\Windows" -Name "CEIPEnable" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LogonType" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" -Name "DCSettingIndex" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" -Name "ACSettingIndex" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "DCSettingIndex" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "ACSettingIndex" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "fAllowUnsolicited" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "fAllowToGetHelp" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Rpc" -Name "EnableAuthEpResolution" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Rpc" -Name "RestrictRemoteClients" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" -Name "DisableQueryRemoteServer" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" -Name "ScenarioExecutionEnabled" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\W32Time\TimeProviders\NtpClient" -Name "Enabled" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\W32Time\TimeProviders\NtpServer" -Name "Enabled" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Explorer" -Name "NoAutoplayfornonVolume" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoAutorun" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDriveTypeAutoRun" /t reg_dword /d "255" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVDiscoveryVolumeType" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVRecovery" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVManageDRA" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVRecoveryPassword" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVRecoveryKey" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVHideRecoveryPage" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVActiveDirectoryBackup" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVActiveDirectoryInfoToStore" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVRequireActiveDirectoryBackup" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVPassphrase" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVAllowUserCert" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVEnforceUserCert" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "UseEnhancedPin" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSRecovery" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSManageDRA" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSRecoveryPassword" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSRecoveryKey" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSHideRecoveryPage" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSActiveDirectoryBackup" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSActiveDirectoryInfoToStore" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSRequireActiveDirectoryBackup" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "MinimumPIN" /t reg_dword /d "7" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "UseAdvancedStartup" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "EnableBDEWithNoTPM" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "UseTPM" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "UseTPMPIN" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "UseTPMKey" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "UseTPMKeyPIN" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVDiscoveryVolumeType" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVRecovery" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVManageDRA" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVRecoveryPassword" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVRecoveryKey" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVHideRecoveryPage" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVActiveDirectoryBackup" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVActiveDirectoryInfoToStore" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVRequireActiveDirectoryBackup" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVPassphrase" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVAllowUserCert" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVEnforceUserCert" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Policies\Microsoft\FVE" -Name "RDVDenyWriteAccess" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVDenyCrossOrg" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "EncryptionMethodNoDiffuser" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\CredUI" -Name "DisablePasswordReveal" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI" -Name "EnumerateAdministrators" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Sidebar" -Name "TurnOffSidebar" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Sidebar" -Name "TurnOffUserInstalledGadgets" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\EMET_Service" -Name "Start" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\SysSettings" -Name "AntiDetours" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\SysSettings" -Name "BannedFunctions" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\SysSettings" -Name "DeepHooks" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\SysSettings" -Name "ExploitAction" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Internet Explorer\iexplore.exe" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\7-Zip\7z.exe" /t reg_sz /d "-EAF" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\7-Zip\7zFM.exe" /t reg_sz /d "*-EAF" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Google\Chrome\Appliation\chrome.exe" /t reg_sz /d "+EAF+ eaf_modules:chrome_child.dll" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Mozilla Firefox\firefox.exe" /t reg_sz /d "+EAF+ eaf_modules:mozjs.dll;xul.dll" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Mozilla Firefox\plugin-container.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Foxit Reader\Foxit Reader.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Google\Google Talk\googletalk.exe" /t reg_sz /d "-DEP" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\iTunes\iTunes.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Windows Live\Writer\WindowsLiveWriter.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Microsoft Lync\communicator.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\mIRC\mirc.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Opera\opera.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Windows Live\Photo Gallery\WLXPhotoGallery.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Adobe\Adobe Photoshop CS*\Photoshop.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Pidgin\pidgin.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\QuickTime\QuickTimePlayer.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Real\RealPlayer\realconverter.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Real\RealPlayer\realplay.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Safari\Safari.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\SkyDrive\SkyDrive.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Skype\Phone\Skype.exe" /t reg_sz /d "-EAF" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Mozilla Thunderbird\thunderbird.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\WinRAR\unrar.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\VideoLAN\VLC\vlc.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Winamp\winamp.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Windows Media Player\wmplayer.exe" /t reg_sz /d "-EAF -MandatoryASLR" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\WinRAR\rar.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\WinRAR\winrar.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\WinZip\winzip32.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\WinZip\winzip64.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\MSACCESS.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Adobe\Acrobat*\Acrobat\Acrobat.exe" /t reg_sz /d "+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Adobe\*\Reader\AcroRd32.exe" /t reg_sz /d "+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\EXCEL.exe" /t reg_sz /d "+ASR asr_modules:flash*.ocx" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\INFOPATH.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Java\jre*\bin\java.exe" /t reg_sz /d "-HeapSpray" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Java\jre*\bin\javaw.exe" /t reg_sz /d "-HeapSpray" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Java\jre*\bin\javaws.exe" /t reg_sz /d "-HeapSpray" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\LYNC.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\OUTLOOK.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\OIS.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\POWERPNT.exe" /t reg_sz /d "+ASR asr_modules:flash*.ocx" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\PPTVIEW.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\MSPUB.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\VISIO.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\VPREVIEW.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\OFFICE1*\WINWORD.exe" /t reg_sz /d "+ASR asr_modules:flash*.ocx" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\Defaults" -Name "*\Windows NT\Accessories\wordpad.exe" /t reg_sz /d " " /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\SysSettings" -Name "ASLR" /t reg_dword /d "3" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\SysSettings" -Name "DEP" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\EMET\SysSettings" -Name "SEHOP" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\EventLog\Application" -Name "Retention" /t reg_sz /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\EventLog\Application" -Name "MaxSize" /t reg_dword /d "32768" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\EventLog\Security" -Name "Retention" /t reg_sz /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\EventLog\Security" -Name "MaxSize" /t reg_dword /d "196608" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\EventLog\Setup" -Name "Retention" /t reg_sz /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\EventLog\Setup" -Name "MaxSize" /t reg_dword /d "32768" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\EventLog\System" -Name "Retention" /t reg_sz /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\EventLog\System" -Name "MaxSize" /t reg_dword /d "32768" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Explorer" -Name "NoDataExecutionPrevention" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Explorer" -Name "NoHeapTerminationOnCorruption" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "PreXPSP2ShellProtocolBehavior" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\HomeGroup" -Name "DisableHomeGroup" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "DisablePasswordSaving" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableCcm" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableCdm" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisableLPT" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "fDisablePNPRedir" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "fPromptForPassword" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "fEncryptRPCTraffic" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "MinEncryptionLevel" /t reg_dword /d "3" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "MaxIdleTime" /t reg_dword /d "900000" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "MaxDisconnectionTime" /t reg_dword /d "60000" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "DeleteTempDirsOnExit" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -Name "PerSessionTempDir" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Internet Explorer\Feeds" -Name "DeleteEnclosureDownload" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Windows Search" -Name "AllowIndexingEncryptedStoresOrItems" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting\Consent" -Name "DefaultConsent" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Installer" -Name "EnableUserControl" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Installer" -Name "SafeForScripting" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\PowerShell\Transcription" -Name "EnableTranscripting" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowBasic" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowUnencryptedTraffic" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" -Name "AllowDigest" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowBasic" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowUnencryptedTraffic" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "DisableRunAs" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" -Name "AllowRemoteShellAccess" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "ScheduledInstallDay" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAUAsDefaultShutdownOption" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAUShutdownOption" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "RescheduleWaitTimeEnabled" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "RescheduleWaitTime" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "ScreenSaveActive" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "SCRNSAVE.EXE" /t reg_sz /d "scrnsave.scr" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "SCRNSAVE.EXE" /t reg_sz /d "scrnsave.scr" /f

New-ItemProperty -Path "HKU\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "ScreenSaverIsSecure" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "ScreenSaveTimeOut" /t reg_sz /d "900" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "ScreenSaveTimeOut" /t reg_sz /d "900" /f

New-ItemProperty -Path "HKU\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Assistance\Client\1.0" -Name "NoImplicitFeedback" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Assistance\Client\1.0" -Name "NoImplicitFeedback" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\&amp;lt;SID&amp;gt;\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Name "SaveZoneInformation" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Name "ScanWithAntiVirus" /t reg_dword /d "3" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoInplaceSharing" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\WindowsMediaPlayer" -Name "PreventCodecDownload" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\WindowsMediaPlayer" -Name "PreventCodecDownload" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\InputPersonalization" -Name "AllowInputPersonalization" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "ScreenSaverGracePeriod" /t reg_sz /d "5" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Services\Netbt\Parameters" -Name "NodeType" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\System" -Name "EnableFontProviders" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\System" -Name "EnableCdp" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Name "DevicePKInitBehavior" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" -Name "DevicePKInitEnabled" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Control Panel\International" -Name "BlockUserInputMethodsForSignIn" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\System" -Name "BlockUserFromShowingAccountDetailsOnSignin" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\System" -Name "DontEnumerateConnectedUsers" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\System" -Name "DisableLockScreenAppNotifications" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "DCSettingIndex" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "ACSettingIndex" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" -Name "DCSettingIndex" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\W32Time\TimeProviders\NtpClient" -Name "Enabled" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\W32Time\TimeProviders\NtpServer" -Name "Enabled" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" -Name "AllowSharedLocalAppData" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessAccountInfo" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessCallHistory" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessContacts" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessEmail" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessLocation" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessMessaging" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessMotion" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessCalendar" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessCamera" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessMicrophone" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessTrustedDevices" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessRadios" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsSyncWithDevices" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessPhone" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessNotifications" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "BlockHostedAppAccessWinRT" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Lsa" -Name "restrictremotesam" /t reg_sz /d "O:BAG:BAD:(A;;RC;;;BA)" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVHardwareEncryption" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVAllowSoftwareEncryptionFailover" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVRestrictHardwareEncryptionAlgorithms" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "FDVAllowedHardwareEncryptionAlgorithms" /t reg_expand_sz /d "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSHardwareEncryption" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSAllowSoftwareEncryptionFailover" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSRestrictHardwareEncryptionAlgorithms" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSAllowedHardwareEncryptionAlgorithms" /t reg_expand_sz /d "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVHardwareEncryption" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVAllowSoftwareEncryptionFailover" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVRestrictHardwareEncryptionAlgorithms" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "RDVAllowedHardwareEncryptionAlgorithms" /t reg_expand_sz /d "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Camera" -Name "AllowCamera" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Connect" -Name "RequirePinForPairing" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" -Name "EnableConfigFlighting" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" -Name "AllowBuildPreview" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" -Name "DODownloadMode" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableWindowsLocationProvider" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Extensions" -Name "ExtensionsEnabled" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" -Name "AllowInPrivate" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" -Name "Cookies" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" -Name "AllowPopups" /t reg_sz /d "yes" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\MicrosoftEdge\SearchScopes" -Name "ShowSearchSuggestionsGlobal" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" -Name "PreventAccessToAboutFlagsInMicrosoftEdge" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" -Name "HideLocalHostIP" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortanaAboveLock" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\Windows Search" -Name "AllowSearchToUseLocation" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Name "NoGenTicket" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsStore" -Name "DisableStoreApps" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsStore" -Name "AutoDownload" /t reg_dword /d "4" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsStore" -Name "DisableOSUpgrade" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsStore" -Name "RemoveWindowsStore" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" -Name "DisableGenericReports" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowSuggestedAppsInWindowsInkWorkspace" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowWindowsInkWorkspace" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" -Name "AllowAutoConfig" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name "BranchReadinessLevel" /t reg_dword /d "32" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdatesPeriodInDays" /t reg_dword /d "180" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdates" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdates" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdatesPeriodInDays" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Assistance\Client\1.0" -Name "NoImplicitFeedback" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Name "SaveZoneInformation" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Name "SaveZoneInformation" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" -Name "ScanWithAntiVirus" /t reg_dword /d "3" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" -Name "ConfigureWindowsSpotlight" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" -Name "ConfigureWindowsSpotlight" /t reg_dword /d "2" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableThirdPartySuggestions" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableThirdPartySuggestions" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoInplaceSharing" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\FVE" -Name "OSPassphrase" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsSpotlightFeatures" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsSpotlightFeatures" /t reg_dword /d "1" /f

New-ItemProperty -Path "HKLM\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" /t reg_dword /d "0" /f

New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ValidateAdminCodeSignatures" /t reg_dword /d "0" /f

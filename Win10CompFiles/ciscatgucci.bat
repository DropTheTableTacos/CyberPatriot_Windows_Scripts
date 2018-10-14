@echo off

:: Start
cls
echo WOWIE this is a script
echo to do a whole crap ton of cis-cat
echo registry values n stuff
echo.
echo Will break system so oof
echo.
pause

cls
echo Are you sure you want to continue?
echo.
pause

:: The Tings
cls

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "scenoapplylegacyauditpolicy" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "crashonauditfail" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AllocateDASD" /t reg_sz /d "2" /f

reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" /v "requiresignorseal" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" /v "sealsecurechannel" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" /v "signsecurechannel" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" /v "disablepasswordchange" /t reg_dword /d "0" /f

reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" /v "requirestrongkey" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DontDisplayLastUserName" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableCAD" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "LegalNoticeText" /t reg_sz /d "a" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "LegalNoticeCaption" /t reg_sz /d "a" /f

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "cachedlogonscount" /t reg_sz /d "4" /f

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "scremoveoption" /t reg_sz /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "RequireSecuritySignature" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "EnableSecuritySignature" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "EnablePlainTextPassword" /t reg_dword /d "0" /f

reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "autodisconnect" /t reg_dword /d "15" /f

reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "requiresecuritysignature" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "enablesecuritysignature" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "enableforcedlogoff" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "SMBServerNameHardeningLevel" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "requiresecuritysignature" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymousSAM" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "disabledomaincreds" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "EveryoneIncludesAnonymous" /t reg_dword /d "0" /f

reg add "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "restrictnullsessaccess" /t reg_dword /d "1" /f

reg del "HKLM\System\CurrentControlSet\Services\LanManServer\Parameters" /v "NullSessionShares" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "ForceGuest" /t reg_dword /d "0" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "UseMachineId" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0" /v "allownullsessionfallback" /t reg_dword /d "0" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa\pku2u" /v "AllowOnlineID" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Kerberos\Parameters" /v "SupportedEncryptionTypes" /t reg_dword /d "2147483644" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "NoLMHash" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" /t reg_dword /d "5" /f

reg add "HKLM\System\CurrentControlSet\Services\LDAP" /v "LDAPClientIntegrity" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0" /v "NTLMMinClientSec" /t reg_dword /d "537395200" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0" /v "NTLMMinServerSec" /t reg_dword /d "537395200" /f

reg add "HKLM\Software\Policies\Microsoft\Cryptography" /v "ForceKeyProtection" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Kernel" /v "ObCaseInsensitive" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Subsystems" /v "Optional" /t reg_multi_sz /d " " /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t reg_dword /d "2" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "AllowLocalPolicyMerge" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "AllowLocalIPsecPolicyMerge" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging" /v "LogFilePath" /t reg_sz /d "%systemroot^%\System32\logfiles\firewall\domainfw.log" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "AllowLocalPolicyMerge" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "AllowLocalIPsecPolicyMerge" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging" /v "LogFilePath" /t reg_sz /d "%systemroot^%\System32\logfiles\firewall\privatefw.log" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "DisableNotifications" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging" /v "LogFilePath" /t reg_sz /d "%systemroot^%\System32\logfiles\firewall\publicfw.log" /f

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D-087DE603E3EA}" /v "DllName" /t reg_sz /d "C:\Program Files\LAPS\CSE\AdmPwd.dll" /f

reg add "HKLM\Software\Policies\Microsoft Services\AdmPwd" /v "PwdExpirationProtectionEnabled" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft Services\AdmPwd" /v "AdmPwdEnabled" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft Services\AdmPwd" /v "PasswordComplexity" /t reg_dword /d "4" /f

reg add "HKLM\Software\Policies\Microsoft Services\AdmPwd" /v "PasswordLength" /t reg_dword /d "15" /f

reg add "HKLM\Software\Policies\Microsoft Services\AdmPwd" /v "PasswordAgeDays" /t reg_dword /d "30" /f

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /t reg_sz /d "0" /f

reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisableIPSourceRouting" /t reg_dword /d "2" /f

reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableIPSourceRouting" /t reg_dword /d "2" /f

reg add "HKLM\System\CurrentControlSet\Services\Rasman\Parameters" /v "disablesavepassword" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t reg_dword /d "0" /f

reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "KeepAliveTime" /t reg_dword /d "300000" /f

reg add "HKLM\System\CurrentControlSet\Services\NetBT\Parameters" /v "nonamereleaseondemand" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "PerformRouterDiscovery" /t reg_dword /d "0" /f

reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "SafeDllSearchMode" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ScreenSaverGracePeriod" /t reg_dword /d "5" /f

reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "tcpmaxdataretransmissions" /t reg_dword /d "3" /f

reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "tcpmaxdataretransmissions" /t reg_dword /d "3" /f

reg add "HKLM\System\CurrentControlSet\Services\Eventlog\Security" /v "WarningLevel" /t reg_dword /d "90" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "AllowLLTDIOOndomain" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "AllowLLTDIOOnPublicNet" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "EnableLLTDIO" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "ProhibitLLTDIOOnPrivateNet" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "AllowRspndrOnDomain" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "AllowRspndrOnPublicNet" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "EnableRspndr" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LLTD" /v "ProhibitRspndrOnPrivateNet" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Peernet" /v "Disabled" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Network Connections" /v "NC_AllowNetBridge_NLA" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Network Connections" /v "NC_StdDomainUserSetLocation" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" /v "\\*\SYSVOL" /t reg_sz /d "RequireMutualAuthentication=1, RequireIntegrity=1" /f

reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t reg_dword /d "255" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" /v "EnableRegistrars" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableUPnPRegistrar" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableInBand802DOT11Registrar" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableFlashConfigRegistrar" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableWPDRegistrar" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WCN\UI" /v "DisableWcnUi" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fMinimizeConnections" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fBlockNonDomain" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "LocalAccountTokenFilterPolicy" /t reg_dword /d "0" /f

reg add "HKLM\System\CurrentControlSet\Control\SecurityProviders\WDigest" /v "UseLogonCredential" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit" /v "ProcessCreationIncludeCmdLine_Enabled" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "DenyDeviceIDs" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "DenyDeviceIDsRetroactive" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "DenyDeviceClasses" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "DenyDeviceClassesRetroactive" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Policies\EarlyLaunch" /v "DriverLoadPolicy" /t reg_dword /d "3" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" /v "NoBackgroundPolicy" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" /v "NoGPOListChanges" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "DisableWebPnPDownload" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Internet Connection Wizard" /v "ExitOnMSICW" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWebServices" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers" /v "DisableHTTPPrinting" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Registration Wizard Control" /v "NoRegistration" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoOnlinePrintsWizard" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoPublishingWizard" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Messenger\Client" /v "CEIP" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "LogonType" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "DCSettingIndex" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "ACSettingIndex" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "DCSettingIndex" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "ACSettingIndex" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Rpc" /v "EnableAuthEpResolution" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Rpc" /v "RestrictRemoteClients" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "DisableQueryRemoteServer" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\W32Time\TimeProviders\NtpClient" /v "Enabled" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\W32Time\TimeProviders\NtpServer" /v "Enabled" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoAutoplayfornonVolume" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t reg_dword /d "255" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVDiscoveryVolumeType" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVRecovery" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVManageDRA" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVRecoveryPassword" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVRecoveryKey" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVHideRecoveryPage" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVActiveDirectoryBackup" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVActiveDirectoryInfoToStore" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVRequireActiveDirectoryBackup" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVPassphrase" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVAllowUserCert" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVEnforceUserCert" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "UseEnhancedPin" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSRecovery" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSManageDRA" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSRecoveryPassword" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSRecoveryKey" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSHideRecoveryPage" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSActiveDirectoryBackup" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSActiveDirectoryInfoToStore" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSRequireActiveDirectoryBackup" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "MinimumPIN" /t reg_dword /d "7" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "UseAdvancedStartup" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "EnableBDEWithNoTPM" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "UseTPM" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "UseTPMPIN" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "UseTPMKey" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "UseTPMKeyPIN" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVDiscoveryVolumeType" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVRecovery" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVManageDRA" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVRecoveryPassword" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVRecoveryKey" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVHideRecoveryPage" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVActiveDirectoryBackup" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVActiveDirectoryInfoToStore" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVRequireActiveDirectoryBackup" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVPassphrase" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVAllowUserCert" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVEnforceUserCert" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Policies\Microsoft\FVE" /v "RDVDenyWriteAccess" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVDenyCrossOrg" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "EncryptionMethodNoDiffuser" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\CredUI" /v "DisablePasswordReveal" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\CredUI" /v "EnumerateAdministrators" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Sidebar" /v "TurnOffSidebar" /t reg_dword /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Sidebar" /v "TurnOffUserInstalledGadgets" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Services\EMET_Service" /v "Start" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\SysSettings" /v "AntiDetours" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\SysSettings" /v "BannedFunctions" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\SysSettings" /v "DeepHooks" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\SysSettings" /v "ExploitAction" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Internet Explorer\iexplore.exe" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\7-Zip\7z.exe" /t reg_sz /d "-EAF" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\7-Zip\7zFM.exe" /t reg_sz /d "*-EAF" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Google\Chrome\Appliation\chrome.exe" /t reg_sz /d "+EAF+ eaf_modules:chrome_child.dll" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Mozilla Firefox\firefox.exe" /t reg_sz /d "+EAF+ eaf_modules:mozjs.dll;xul.dll" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Mozilla Firefox\plugin-container.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Foxit Reader\Foxit Reader.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Google\Google Talk\googletalk.exe" /t reg_sz /d "-DEP" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\iTunes\iTunes.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Windows Live\Writer\WindowsLiveWriter.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Microsoft Lync\communicator.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\mIRC\mirc.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Opera\opera.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Windows Live\Photo Gallery\WLXPhotoGallery.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Adobe\Adobe Photoshop CS*\Photoshop.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Pidgin\pidgin.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\QuickTime\QuickTimePlayer.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Real\RealPlayer\realconverter.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Real\RealPlayer\realplay.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Safari\Safari.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\SkyDrive\SkyDrive.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Skype\Phone\Skype.exe" /t reg_sz /d "-EAF" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Mozilla Thunderbird\thunderbird.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\WinRAR\unrar.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\VideoLAN\VLC\vlc.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Winamp\winamp.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Windows Media Player\wmplayer.exe" /t reg_sz /d "-EAF -MandatoryASLR" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\WinRAR\rar.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\WinRAR\winrar.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\WinZip\winzip32.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\WinZip\winzip64.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\MSACCESS.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Adobe\Acrobat*\Acrobat\Acrobat.exe" /t reg_sz /d "+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Adobe\*\Reader\AcroRd32.exe" /t reg_sz /d "+EAF+ eaf_modules:AcroRd32.dll;Acrofx32.dll;AcroForm.api" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\EXCEL.exe" /t reg_sz /d "+ASR asr_modules:flash*.ocx" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\INFOPATH.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Java\jre*\bin\java.exe" /t reg_sz /d "-HeapSpray" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Java\jre*\bin\javaw.exe" /t reg_sz /d "-HeapSpray" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Java\jre*\bin\javaws.exe" /t reg_sz /d "-HeapSpray" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\LYNC.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\OUTLOOK.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\OIS.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\POWERPNT.exe" /t reg_sz /d "+ASR asr_modules:flash*.ocx" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\PPTVIEW.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\MSPUB.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\VISIO.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\VPREVIEW.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\OFFICE1*\WINWORD.exe" /t reg_sz /d "+ASR asr_modules:flash*.ocx" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\Defaults" /v "*\Windows NT\Accessories\wordpad.exe" /t reg_sz /d " " /f

reg add "HKLM\Software\Policies\Microsoft\EMET\SysSettings" /v "ASLR" /t reg_dword /d "3" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\SysSettings" /v "DEP" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\EMET\SysSettings" /v "SEHOP" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\Application" /v "Retention" /t reg_sz /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\Application" /v "MaxSize" /t reg_dword /d "32768" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\Security" /v "Retention" /t reg_sz /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\Security" /v "MaxSize" /t reg_dword /d "196608" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\Setup" /v "Retention" /t reg_sz /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\Setup" /v "MaxSize" /t reg_dword /d "32768" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\System" /v "Retention" /t reg_sz /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\EventLog\System" /v "MaxSize" /t reg_dword /d "32768" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoDataExecutionPrevention" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoHeapTerminationOnCorruption" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "PreXPSP2ShellProtocolBehavior" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "DisablePasswordSaving" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCcm" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCdm" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableLPT" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisablePNPRedir" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fPromptForPassword" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fEncryptRPCTraffic" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MinEncryptionLevel" /t reg_dword /d "3" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxIdleTime" /t reg_dword /d "900000" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "MaxDisconnectionTime" /t reg_dword /d "60000" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "DeleteTempDirsOnExit" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "PerSessionTempDir" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Feeds" /v "DeleteEnclosureDownload" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t reg_dword /d "0" /f

reg delete "HKLM\Software\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultConsent" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "EnableUserControl" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "AlwaysInstallElevated" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Installer" /v "SafeForScripting" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v "EnableScriptBlockLogging" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\PowerShell\Transcription" /v "EnableTranscripting" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" /v "AllowBasic" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" /v "AllowUnencryptedTraffic" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Client" /v "AllowDigest" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "AllowBasic" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "AllowUnencryptedTraffic" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "DisableRunAs" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service\WinRS" /v "AllowRemoteShellAccess" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallDay" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAUAsDefaultShutdownOption" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAUShutdownOption" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RescheduleWaitTimeEnabled" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RescheduleWaitTime" /t reg_dword /d "1" /f

reg add "HKU\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "ScreenSaveActive" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "SCRNSAVE.EXE" /t reg_sz /d "scrnsave.scr" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "SCRNSAVE.EXE" /t reg_sz /d "scrnsave.scr" /f

reg add "HKU\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t reg_sz /d "900" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t reg_sz /d "900" /f

reg add "HKU\&amp;lt;SID&amp;gt;\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoImplicitFeedback" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoImplicitFeedback" /t reg_dword /d "1" /f

reg add "HKU\&amp;lt;SID&amp;gt;\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t reg_dword /d "2" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t reg_dword /d "3" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInplaceSharing" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\Installer" /v "AlwaysInstallElevated" /t reg_dword /d "0" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\Installer" /v "AlwaysInstallElevated" /t reg_dword /d "0" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventCodecDownload" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventCodecDownload" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ScreenSaverGracePeriod" /t reg_sz /d "5" /f

reg add "HKLM\System\CurrentControlSet\Services\Netbt\Parameters" /v "NodeType" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableFontProviders" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableCdp" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" /v "DevicePKInitBehavior" /t reg_dword /d "0" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\kerberos\parameters" /v "DevicePKInitEnabled" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Control Panel\International" /v "BlockUserInputMethodsForSignIn" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "BlockUserFromShowingAccountDetailsOnSignin" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DontEnumerateConnectedUsers" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "DisableLockScreenAppNotifications" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" /v "DCSettingIndex" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" /v "ACSettingIndex" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15576e8-98b7-4186-b944-eafa664402d9" /v "DCSettingIndex" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\W32Time\TimeProviders\NtpClient" /v "Enabled" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\W32Time\TimeProviders\NtpServer" /v "Enabled" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager" /v "AllowSharedLocalAppData" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessAccountInfo" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCallHistory" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessContacts" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessEmail" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessLocation" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMessaging" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMotion" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCalendar" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessCamera" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessMicrophone" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessTrustedDevices" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessRadios" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsSyncWithDevices" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessPhone" /t reg_dword /d "2" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessNotifications" /t reg_dword /d "2" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "BlockHostedAppAccessWinRT" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Lsa" /v "restrictremotesam" /t reg_sz /d "O:BAG:BAD:(A;;RC;;;BA)" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVHardwareEncryption" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVAllowSoftwareEncryptionFailover" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVRestrictHardwareEncryptionAlgorithms" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "FDVAllowedHardwareEncryptionAlgorithms" /t reg_expand_sz /d "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSHardwareEncryption" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSAllowSoftwareEncryptionFailover" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSRestrictHardwareEncryptionAlgorithms" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSAllowedHardwareEncryptionAlgorithms" /t reg_expand_sz /d "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVHardwareEncryption" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVAllowSoftwareEncryptionFailover" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVRestrictHardwareEncryptionAlgorithms" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "RDVAllowedHardwareEncryptionAlgorithms" /t reg_expand_sz /d "2.16.840.1.101.3.4.1.2;2.16.840.1.101.3.4.1.42" /f

reg add "HKLM\Software\Policies\Microsoft\Camera" /v "AllowCamera" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Connect" /v "RequirePinForPairing" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Extensions" /v "ExtensionsEnabled" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "AllowInPrivate" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "Cookies" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "AllowPopups" /t reg_sz /d "yes" /f

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\SearchScopes" /v "ShowSearchSuggestionsGlobal" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "PreventAccessToAboutFlagsInMicrosoftEdge" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v "HideLocalHostIP" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v "NoGenTicket" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "DisableStoreApps" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t reg_dword /d "4" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "DisableOSUpgrade" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsStore" /v "RemoveWindowsStore" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericReports" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" /v "AllowSuggestedAppsInWindowsInkWorkspace" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WinRM\Service" /v "AllowAutoConfig" /t reg_dword /d "0" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "BranchReadinessLevel" /t reg_dword /d "32" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdatesPeriodInDays" /t reg_dword /d "180" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdates" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferQualityUpdates" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferQualityUpdatesPeriodInDays" /t reg_dword /d "0" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoImplicitFeedback" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t reg_dword /d "2" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t reg_dword /d "2" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t reg_dword /d "3" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" /v "ConfigureWindowsSpotlight" /t reg_dword /d "2" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" /v "ConfigureWindowsSpotlight" /t reg_dword /d "2" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInplaceSharing" /t reg_dword /d "1" /f

reg add "HKLM\Software\Policies\Microsoft\FVE" /v "OSPassphrase" /t reg_dword /d "0" /f

reg add "HKU\S-1-5-21-3985297738-3525474143-4145663172-1000\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t reg_dword /d "1" /f

reg add "HKU\S-1-5-21-358118824-3846515562-1363085019-1003\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t reg_dword /d "1" /f

reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t reg_dword /d "0" /f

cls
echo It's done now!
echo.
echo Now ya got a broked system oof
echo.

pause

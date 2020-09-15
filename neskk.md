Windows 10 Preferences:
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 -include "%~dp0Win10.psm1" -preset neskk.preset

Disable and Uninstall OneDrive
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 -include "%~dp0Win10.psm1"  DisableOneDrive UninstallOneDrive

Update:
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 EnableFldrSeparateProcess DisableSharingWizard

Clean up This PC:
powershell.exe -NoProfile -ExecutionPolicy Bypass -File Win10.ps1 HideDesktopFromThisPC HideDocumentsFromThisPC HideDownloadsFromThisPC HideMusicFromThisPC HidePicturesFromThisPC HideVideosFromThisPC

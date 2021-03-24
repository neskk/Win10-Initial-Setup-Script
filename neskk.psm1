Function EnableShellShortcut($Name, $Path, $Cmd) {
    Write-Output "Enabling shell shortcut '$Name'..."

    If (!(Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }
    Set-Item -Path $Path -Value $Name
    Set-ItemProperty -Path $Path -Name "Extended" -Type String -Value ""
    Set-ItemProperty -Path $Path -Name "HasLUAShield" -Type String -Value ""

    # Command children-item
    $PathCmd = $Path + "\command"
    If (!(Test-Path $PathCmd)) {
        New-Item -Path $PathCmd -Force | Out-Null
    }
    Set-Item -Path $PathCmd -Value $Cmd
}

Function DisableShellShortcut($Name, $Path) {
    Write-Output "Disabling shell shortcut '$Name'..."
    Remove-Item -Path $Path -Recurse
}

# -----------------------------------------------------------------------------
# Enable directory shell shortcut "Open command window here"
Function EnableDirShellCmdAdmin {
    $Path = "HKLM:\SOFTWARE\Classes\Directory\shell\cmd_admin"
    $Name = "Open command window here"
    $Cmd = 'cmd.exe /s /k pushd "%V"'

    EnableShellShortcut -Path $Path -Name $Name -Cmd $Cmd
}

# Disable directory shell shortcut "Open command window here"
Function DisableDirShellCmdAdmin {
    $Path = "HKLM:\SOFTWARE\Classes\Directory\shell\cmd_admin"
    $Name = "Open command window here"

    DisableShellShortcut -Path $Path -Name $Name
}

# -----------------------------------------------------------------------------
# Enable directory background shortcut "Open command window here"
Function EnableDirBgCmdAdmin {
    $Path = "HKLM:\SOFTWARE\Classes\Directory\Background\shell\cmd_admin"
    $Name = "Open command window here"
    $Cmd = 'cmd.exe /s /k pushd "%V"'

    EnableShellShortcut -Path $Path -Name $Name -Cmd $Cmd
}

# Disable directory background shortcut "Open command window here"
Function DisableDirBgCmdAdmin {
    $Path = "HKLM:\SOFTWARE\Classes\Directory\Background\shell\cmd_admin"
    $Name = "Open command window here"

    DisableShellShortcut -Path $Path -Name $Name
}

# -----------------------------------------------------------------------------
# Enable drive shell shortcut "Open command window here"
Function EnableDriveCmdAdmin {
    $Path = "HKLM:\SOFTWARE\Classes\Drive\shell\cmd_admin"
    $Name = "Open command window here"
    $Cmd = 'cmd.exe /s /k pushd "%V"'

    EnableShellShortcut -Path $Path -Name $Name -Cmd $Cmd
}

# Disable drive shell shortcut "Open command window here"
Function DisableDriveCmdAdmin {
    $Path = "HKLM:\SOFTWARE\Classes\Drive\shell\cmd_admin"
    $Name = "Open command window here"

    DisableShellShortcut -Path $Path -Name $Name
}

# EnableDirShellCmdAdmin # DisableDirShellCmdAdmin
# EnableDirBgCmdAdmin # DisableDirBgCmdAdmin
# EnableDriveCmdAdmin # DisableDriveCmdAdmin

Function InstallChocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# https://chocolatey.org/packages/
Function InstallSoftwareWithChocolatey {

    Write-Output "Installing Microsoft Visual C++ Redistributable for Visual Studio 2015-2019..."
    choco upgrade vcredist140 -y

    Write-Output "Installing Adobe Acrobat Reader..."
    choco upgrade adobereader -y

    Write-Output "Installing Flash Player Plugin..."
    choco upgrade flashplayerplugin -y

    Write-Output "Installing Google Chrome..."
    choco upgrade googlechrome -y

    Write-Output "Installing Mozilla Firefox..."
    choco upgrade firefox -y

    Write-Output "Installing Mozilla Thunderbird..."
    choco upgrade thunderbird -y

    Write-Output "Installing VLC..."
    choco upgrade vlc -y

    Write-Output "Installing Calibre..."
    choco upgrade calibre -y

    Write-Output "Installing WinRAR..."
    choco upgrade winrar -y

    Write-Output "Installing Notepad2..."
    choco upgrade notepad2 -y

    Write-Output "Installing OpenSSH..."
    choco upgrade openssh -y

    Write-Output "Installing FileZilla..."
    choco upgrade filezilla -y

    Write-Output "Installing Python 3..."
    choco upgrade python3 -y

    Write-Output "Installing NodeJS..."
    choco upgrade nodejs -y

    Write-Output "Installing PHP..."
    choco upgrade php -y --package-parameters="/InstallDir:C:\Program Files\PHP"

    Write-Output "Installing OpenJDK 8..."
    choco upgrade openjdk8 -y

    Write-Output "Installing JDK 11..."
    choco upgrade openjdk11 -y

    Write-Output "Installing JDK 15..."
    choco upgrade openjdk -y

    Write-Output "Installing Maven..."
    choco upgrade maven -y

    Write-Output "Installing WinMerge..."
    choco upgrade winmerge -y

    Write-Output "Installing Git SCM..."
    choco upgrade git -y

    Write-Output "Installing DBeaver..."
    choco upgrade dbeaver -y

    Write-Output "Installing Visual Studio Code..."
    choco upgrade vscode --params "/NoDesktopIcon /DontAddToPath" -y

    Write-Output "Installing Android SDK..."
    choco upgrade android-sdk -y

    Write-Output "Installing Microsoft Teams..."
    choco upgrade microsoft-teams -y

    Write-Output "Installing Discord..."
    choco upgrade discord -y

    Write-Output "Installing Zoom..."
    choco upgrade zoom -y

    Write-Output "Installing OpenVPN..."
    choco upgrade openvpn -y

    Write-Output "Installing qBitTorrent..."
    choco upgrade qbittorrent -y

    Write-Output "Installing SoulSeek"
    choco upgrade soulseek -y

    Write-Output "Installing SysInternals..."
    choco upgrade sysinternals -y

    Write-Output "Installing AutoHotKey..."
    choco upgrade autohotkey -y

    Write-Output "Installing KeePass..."
    choco upgrade keepass -y

    Write-Output "Installing FFmpeg..."
    choco upgrade ffmpeg -y

    Write-Output "Installing MKVToolNix..."
    choco upgrade mkvtoolnix -y

    Write-Output "Installing Blender..."
    choco upgrade blender -y

    Write-Output "Installing GIMP..."
    choco upgrade gimp -y

    Write-Output "Installing CD Burner XP..."
    choco upgrade cdburnerxp -y

    Write-Output "Installing Steam..."
    choco upgrade steam -y

    Write-Output "Installing Audacity..."
    choco upgrade audacity -y

    Write-Output "Installing MusicBee..."
    choco upgrade musicbee -y

    Write-Output "Installing TagScanner..."
    choco upgrade tagscanner -y

    Write-Output "Installing SubtitleWorkshop..."
    choco upgrade subtitleworkshop -y

    Write-Output "Installing Google Backup and Sync..."
    choco upgrade google-backup-and-sync -y

    Write-Output "Installing OBS Studio..."
    choco upgrade obs-studio -y

    Write-Output "Installing LICEcap..."
    choco upgrade licecap -y
}
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

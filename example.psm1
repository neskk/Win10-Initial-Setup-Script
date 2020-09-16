# Enable some feature
Function EnableSomeFeature {
    Write-Output "Enabling some feature..."
    If (!(Test-Path "HKLM:\Some\Registry\Key")) {
        New-Item -Path "HKLM:\Some\Registry\Key" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\Some\Registry\Key" -Name "SomeValueName" -Type String -Value "SomeValue"
}

# Disable some feature
Function DisableSomeFeature {
    Write-Output "Disabling some feature..."
    Remove-ItemProperty -Path "HKLM:\Some\Registry\Key" -Name "SomeValueName" -ErrorAction SilentlyContinue
}

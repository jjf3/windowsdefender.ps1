# Define variables
$devices = Get-Content -Path "device_list.txt" # Assuming you have a text file named device_list.txt containing device IDs or names
$antivirusSetting = New-Object -TypeName Microsoft.Management.WindowsIntune.Clients.AntivirusSetting
$firewallSetting = New-Object -TypeName Microsoft.Management.WindowsIntune.Clients.FirewallSetting
$deviceControlSetting = New-Object -TypeName Microsoft.Management.WindowsIntune.Clients.DeviceControlSetting
$networkProtectionSetting = New-Object -TypeName Microsoft.Management.WindowsIntune.Clients.NetworkProtectionSetting
$securityIntelligenceUpdateSetting = New-Object -TypeName Microsoft.Management.WindowsIntune.Clients.SecurityIntelligenceUpdateSetting

# Configure Antivirus settings
$antivirusSetting.Enabled = $true
$antivirusSetting.RealtimeProtectionEnabled = $true
$antivirusSetting.ScanType = "Quick"

# Configure Firewall settings
$firewallSetting.Enabled = $true
$firewallSetting.BlockAllIncoming = $true

# Configure Device Control settings
$deviceControlSetting.Enabled = $true

# Configure Network Protection settings
$networkProtectionSetting.Enabled = $true

# Configure Security Intelligence Update settings
$securityIntelligenceUpdateSetting.AutoUpdate = $true

# Set policies for each device
foreach ($device in $devices) {
    $deviceId = $device # Assuming device ID or name
    # Set Antivirus policy
    Set-WindowsIntuneClientAntivirusSetting -DeviceId $deviceId -AntivirusSetting $antivirusSetting
    # Set Firewall policy
    Set-WindowsIntuneClientFirewallSetting -DeviceId $deviceId -FirewallSetting $firewallSetting
    # Set Device Control policy
    Set-WindowsIntuneClientDeviceControlSetting -DeviceId $deviceId -DeviceControlSetting $deviceControlSetting
    # Set Network Protection policy
    Set-WindowsIntuneClientNetworkProtectionSetting -DeviceId $deviceId -NetworkProtectionSetting $networkProtectionSetting
    # Set Security Intelligence Update policy
    Set-WindowsIntuneClientSecurityIntelligenceUpdateSetting -DeviceId $deviceId -SecurityIntelligenceUpdateSetting $securityIntelligenceUpdateSetting
}

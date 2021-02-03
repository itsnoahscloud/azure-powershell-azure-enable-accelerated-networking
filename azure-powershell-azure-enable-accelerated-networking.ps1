# Enable accelerated networking

$resourcegroupname = "resourcegroup1"
$vmname = "vm1"
$nicname = "nicname"

# Deallocate VM
stop-azvm -ResourceGroupName $resourcegroupname -name $vmname -force

# Enable Accelerated Networking
$nic=Get-AzNetworkInterface -Name $nicname -ResourceGroupName $resourcegroupname
$nic.EnableAcceleratedNetworking = $True
$nic | Set-AzNetworkInterface

# Start $VM
start-azvm -ResourceGroupName $resourcegroupname -name $vmname
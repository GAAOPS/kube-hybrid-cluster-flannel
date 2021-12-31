# Example: .\Import-Vm-FromDisk.ps1 -DestinationPath "E:\KubeV2" -VmName "K-C1-P-L-2" -VMCXPath "F:\Kube-Templates\Ubuntu-Server-20.4\Virtual Machines\2C078764-42D4-4889-961E-10A43D0DD020.vmcx"
param (
    [Parameter(Mandatory)]
    [string]$DestinationPath,   
    [Parameter(Mandatory)]
    [string]$VmName,
    [Parameter(Mandatory)]
    [string]$VMCXPath
)

$BaseDir= Join-Path $DestinationPath $VmName

$SmartPagingFilePath = Join-Path $BaseDir "Paging"
$SnapshotFilePath= Join-Path $BaseDir "Snapshots"
$VhdDestinationPath= Join-Path $BaseDir "Virtual Hard Disks"
$VirtualMachinePath= $BaseDir

Import-VM -Path $VMCXPath -Copy -GenerateNewId -SmartPagingFilePath $SmartPagingFilePath -SnapshotFilePath $SnapshotFilePath -VhdDestinationPath $VhdDestinationPath -VirtualMachinePath $VirtualMachinePath
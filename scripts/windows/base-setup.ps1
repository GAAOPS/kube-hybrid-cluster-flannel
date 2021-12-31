#######################################################################
# Common Setup for all windows nodes
#######################################################################
# Confirm the Windows version and build number:
Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"

# get windows
if(-not((Get-WindowsFeature -Name containers).Installed)){
    Install-WindowsFeature -Name containers
    Restart-Computer -Force
}

if(-not(get-Module DockerMsftProvider -ListAvailable)){
    Install-Module DockerMsftProvider -Force
	
    Install-Package Docker -ProviderName DockerMsftProvider -Force     
    Set-Service -Name docker -StartupType 'Automatic'
    Restart-Computer -Force
}

New-Item -ItemType Directory -Path c:\tmp -Force
Invoke-WebRequest https://raw.githubusercontent.com/kubernetes-sigs/sig-windows-tools/master/kubeadm/scripts/PrepareNode.ps1  -OutFile C:\tmp\PrepareNode.ps1


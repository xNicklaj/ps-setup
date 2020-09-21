Write-Host -ForegroundColor Yellow "Chocolatey Disclaimer:
Your use of the packages on this site means you understand they are not supported or guaranteed in any way. 
Due to the nature of a public repository and unreliability due to distribution rights, these packages should not be used as is for organizational purposes either."
Write-Host ""
#Install chocolatey
$testchoco = powershell choco -v
if(-not($testchoco)){
    Write-Host -ForegroundColor Red "Seems Chocolatey is not installed, installing now"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Host -ForegroundColor Green "Chocolatey Version $testchoco is already installed"
}

#Nvidia GPU Drivers
If ((Get-WmiObject Win32_VideoController).name | Select-String -Pattern 'NVIDIA'){
	Write-Host "Nvidia GPU Detected, installing GPU Drivers..."
	choco install -y nvidia-display-driver
	choco install -y geforce-experience
}

#AMD Ryzen Drivers
If ((Get-WmiObject Win32_Processor).name | Select-String -Pattern 'AMD Ryzen'){
	Write-Host "AMD Ryzen CPU Detected, installing CPU Drivers..."
	choco install -y amd-ryzen-chipset
}

#Intel Graphics Divers
If ((Get-WmiObject Win32_Processor).name | Select-String -Pattern 'INTEL'){
	Write-Host "Intel CPU Detected, installing Intel Graphics Drivers..."
	choco install -y intel-graphics-driver
}

Write-Host "Installation finished."
Write-Host "Press any key to continue ....."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
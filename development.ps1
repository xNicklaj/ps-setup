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

function chocoInstall($arr) {
	if($mode -eq "m")
	{
		Write-Host "Select the packages to install: "
		for ($i = 0; $i -lt $arr.count; $i++) {
			Write-Host "$i) $($arr[$i])"
		}
	
		$input = Read-Host -Prompt "Specify packages separated by commas"
		$input = $input -replace '\s',''
		$input = $input -Split ','
	
		if($input -ne $null)
		{
			$input | ForEach-Object {
				powershell choco install -y $arr[$PSItem]
			}
		}
	}
	else{
		$arr | ForEach-Object {
			powershell choco install -y $PSItem
		}
	}
}

function listPackages($arr) {
	$arr | ForEach-Object {
		Write-Host " - $PSItem"
	}
}

$editor = @('vscode', 'neovim')
$webdev = @('nodejs', 'yarn', 'bitnami-xampp', 'nginx')
$database = @('mariadb', 'mongodb')
$javadev = @('openjdk', 'openjdk8')
$desktopdev = @('mingw', 'rust', 'rustup')
$androiddev = @('androidstudio', 'koktlinc', 'flutter', 'dart-sdk')
$tool = @('docker-desktop')
$versioncontrol = @('git', 'github-desktop')

Write-Host "The following packages will be installed: "

Write-Host "--- Editors ---"
listPackages($editor)
Write-Host "--- Web ---"
listPackages($webdev)
Write-Host "--- Databases ---"
listPackages($database)
Write-Host "--- Java ---"
listPackages($javadev)
Write-Host "--- Desktop ---"
listPackages($desktopdev)
Write-Host "--- Android ---"
listPackages($androiddev)
Write-Host "--- Tools ---"
listPackages($tool)
Write-Host "--- Version Control ---"
listPackages($versioncontrol)

do {
	$mode = Read-Host -Prompt "Select whether you want to perform an [A]utomated or a [m]anual installation"
	if($mode -eq ""){
		$mode = "a"
	}
} while(($mode.ToLower() -ne "A") -and ($mode.ToLower() -ne "M"))

Write-Host "--- Editors ---"
chocoInstall($editor)
Write-Host "--- Web ---"
chocoInstall($webdev)
Write-Host "--- Databases ---"
chocoInstall($database)
Write-Host "--- Java ---"
chocoInstall($javadev)
Write-Host "--- Desktop ---"
chocoInstall($desktopdev)
Write-Host "--- Android ---"
chocoInstall($androiddev)
Write-Host "--- Tools ---"
chocoInstall($tool)
Write-Host "--- Version Control ---"
chocoInstall($versioncontrol)

Write-Host "Installation finished."
Write-Host "Press any key to continue ....."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
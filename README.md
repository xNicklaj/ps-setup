# ps-setup
These scripts aim to automate the installation process of many common programs via [chocolatey](https://chocolatey.org), one of the most efficient windows package managers.
I've written them mostly for myself, as I find them particularly useful when you need to factory reset a computer but don't want to bother too much on reinstalling all the software you commonly use.
## How to use it
Simply clone this repository, open a new elevated rights instance of powershell (or the new windows terminal) and use this command to enable third party scripts:
`Set-ExecutionPolicy Bypass -Scope Process -Force`.

Then start the scripts and follow the installation process.

Every script works on its own, you don't need to run all of them, but instead you can simply run the ones that contain the packages that interest you.
## Package list
This is a list of the packages contained in the scripts.
Note that the during the installation you will be asked wether you want to install all of them, or choose what packages to install.
### drivers.ps1
* Nvidia Display Drivers
* Nvidia GeForce Experience
* AMD Ryzen Chipset Drivers
* Intel Graphics Drivers
### development.ps1
* Visual Studio Code
* Neovim
* NodeJS
* Yarn
* Bitnami-Xampp
* Nginx
* MariaDB
* MongoDB
* OpenJDK
* OpenJDK 8
* MingW 32x/64x
* Rust
* Rustup
* Android Studio
* Kotlin
* Flutter
* Dart
* Docker Desktop
* Git
* Github Desktop
### gaming.ps1
* Steam
* Uplay
* Epic Games Launcher
* GOG Galaxy
* Origin

#Stephen Sparks 
$vlcPath = Test-Path -Path 'C:\Program Files\VideoLAN\VLC\'
$driodPath = Test-Path -Path 'C:\Program Files\Android\Android Studio'
$legoPath = Test-Path -Path 'C:\Program Files (x86)\LEGO Software\LEGO MINDSTORMS Edu EV3'
$treePath = Test-Path -Path 'C:\Program Files (x86)\JAM Software\TreeSize Free'

if(($vlcPath -eq 'True') -and ($driodPath -eq 'True') -and ($legoPath -eq 'True') -and ($treePath = 'True')){
	BREAK
}else{

	Start-Process -FilePath \\DC01\NewITShare$\applications\vlc-3.0.17.4-win64.exe -ArgumentList /S 
	Start-Process -FilePath \\DC01\NewITShare$\applications\android-studio-2021.1.1.23-windows.exe -ArgumentList /S
	Start-Process -FilePath \\DC01\NewITShare$\applications\LME-EV3_Full-setup_1.4.5_en-US_WIN32.exe -ArgumentList '/q /AcceptLicenses Yes'
	Start-Process -FilePath \\DC01\NewITShare$\applications\TreeSizeFreeSetup.exe -ArgumentList /VERYSILENT 
}
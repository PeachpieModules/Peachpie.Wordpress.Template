param (
    [string]$build
)

if($build -ne "Release" -and $build -ne "Debug")
{
    Write-Host("Need to set build parameter to either 'Release' or 'Debug'");
    return;
}


$basePath = Get-Location;

Get-ChildItem "$basePath/src/Patches" -Directory |
ForEach-Object {
    Set-Location $_.FullName;
    Invoke-Expression "dotnet build -c $build --force";
}

Get-ChildItem "$basePath/src/Plugins" -Directory |
ForEach-Object {
    Set-Location $_.FullName;
    Invoke-Expression "dotnet build -c $build --force";
}

Get-ChildItem "$basePath/src/MustUsePlugins" -Directory |
ForEach-Object {
    Set-Location $_.FullName;
    Invoke-Expression "dotnet build -c $build --force";
}

Get-ChildItem "$basePath/src/Themes" -Directory |
ForEach-Object {
    Set-Location $_.FullName;
    Invoke-Expression "dotnet build -c $build --force";
}

if($build -eq "Debug")
{
    Set-Location "$basePath/src/Server";
    Invoke-Expression "dotnet build -c $build --force";
}
if($build -eq "Release")
{
    Set-Location "$basePath/src/Server";
    Invoke-Expression "dotnet publish -c $build --force";
}

Set-Location $basePath;
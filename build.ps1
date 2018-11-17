param (
    [string]$build
)

if($build -ne "Release" -and $build -ne "Debug")
{
    Write-Host("Need to set build parameter to either 'Release' or 'Debug'");
    return;
}

Write-Host("Building Wordpress: $build");

$basePath = Get-Location;

Write-Host("Building Patches Wordpress: $build");
Get-ChildItem "$basePath/src/Patches" -Directory |
ForEach-Object {
    Set-Location $_.FullName;
    Invoke-Expression "dotnet build -c $build --force";
}

Write-Host("Building Wordpress Must Use Plugins: $build");
Get-ChildItem "$basePath/src/MustUsePlugins" -Directory |
ForEach-Object {
    Set-Location $_.FullName;
    Invoke-Expression "dotnet build -c $build --force";
}

Write-Host("Building Wordpress Plugins: $build");
Get-ChildItem "$basePath/src/Plugins" -Directory |
ForEach-Object {
    Set-Location $_.FullName;
    Invoke-Expression "dotnet build -c $build --force";
}

Write-Host("Building Wordpress Themes: $build");
Get-ChildItem "$basePath/src/Themes" -Directory |
ForEach-Object {
    Set-Location $_.FullName;
    Invoke-Expression "dotnet build -c $build --force";
}

Set-Location $basePath;
Get-ChildItem -Directory -Recurse -Depth 2 | ForEach-Object {
Write-Debug("Checking " + $_.FullName)
if(Test-Path ($_.FullName + "/.git")) {
Write-Host("Found Git Repo: " + $_.Name + ", fetching...")
Push-Location $_.FullName
git fetch --all
Write-Host("Finished Fetching " + $_.Name + [Environment]::NewLine)
Pop-Location
}
}
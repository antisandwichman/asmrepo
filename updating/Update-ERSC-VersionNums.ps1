# GitHub repository information
$owner = "LukeYui"   # Replace with the owner of the repo (e.g., "microsoft")
$repo = "EldenRingSeamlessCoopRelease"     # Replace with the repo name (e.g., "PowerToys")

# GitHub API endpoint to get latest release information
$apiUrl = "https://api.github.com/repos/$owner/$repo/releases/latest"

# Fetch the latest release information
try {
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get

    # Display the tag name of the latest release (usually contains the version)
    $latestVersion = $response.tag_name
    Write-Output "Latest release version: $latestVersion"
    $manifestJSON = "$($env:ersc_manifest)"
    $manifest = Get-Content "$manifestJSON" -ErrorAction Stop | Out-String | ConvertFrom-Json
    $replacingVersion = "v$($manifest.version)"
    Write-Output "Current manifest version: $replacingVersion"

    $manifest.version = $latestVersion
    $manifest.url = $manifest.url = $manifest.url -replace "/v[0-9]+\.[0-9]+\.[0-9]+/", "/$latestVersion/"

    $manifest | ConvertTo-Json -Depth 100 | Set-Content -Path $manifestJSON


} catch {
    Write-Error "Failed to get release information from GitHub. Error: $_"
}
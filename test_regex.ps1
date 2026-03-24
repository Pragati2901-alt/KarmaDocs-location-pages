# MAXIMUM UNIQUENESS GENERATION ENGINE - VERSION 9.0
# Regex debugging and validation.

$BaseDir = "c:\Users\GCV\Desktop\KarmaDocs location pages\areas-we-serve"
$TemplateFile = Join-Path $BaseDir 'psychiatrist-near-indio.html'

$Locations = @('Victoria Park', 'Rancho Mirage', 'Palm Desert')

$Template = [System.IO.File]::ReadAllText($TemplateFile)

# Regex for Community Section
$ComRex = '(?s)<!--\s*ABOUT\s+INDIO.*?LOCAL\s+COMMUNITY\s+SECTION\s*-->.*?<!--\s*PATIENT\s+TESTIMONIALS\s+SLIDER\s*-->'

if ($Template -match $ComRex) {
    Write-Host "Success: Found Community Section marker!"
} else {
    Write-Host "Error: Could not find Community Section marker with current regex."
}

# Test a simple replace
$NewContent = "<!-- COMMUNITY REPLACED -->`n<!-- PATIENT TESTIMONIALS SLIDER -->"
$TestResult = $Template -replace $ComRex, $NewContent

if ($TestResult -match 'COMMUNITY REPLACED') {
    Write-Host "Success: Replace worked!"
} else {
    Write-Host "Error: Replace failed!"
}

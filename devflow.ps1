param(
    [string]$clear,
    [switch]$buildWindows,
    [switch]$buildMobile,
    [switch]$buildWeb,
    [switch]$runWindows,
    [switch]$runMobile,
    [switch]$runWeb,
    [Alias("h")]
    [switch]$help
)

# Help menu
if ($help) {
    Write-Host ""
    Write-Host "DevFlow - Flutter Automation Script" -ForegroundColor Cyan
    Write-Host "-----------------------------------"
    Write-Host ""
    Write-Host "Usage:"
    Write-Host "  ./devflow.ps1 [options]"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -clear <path>       Deletes a file before running (e.g. database)"
    Write-Host "  -buildWindows       Build Windows app"
    Write-Host "  -buildMobile        Build Android APK"
    Write-Host "  -buildWeb           Build Web app"
    Write-Host "  -runWindows         Run Windows app"
    Write-Host "  -runMobile          Run Android app"
    Write-Host "  -runWeb             Run Web (Chrome)"
    Write-Host "  -h, -help           Show this help menu"
    Write-Host ""
    Write-Host "Examples:"
    Write-Host "  ./devflow.ps1 -runWindows"
    Write-Host "  ./devflow.ps1 -buildWeb -runWeb"
    Write-Host "  ./devflow.ps1 -clear database/test_db1.sqlite -runWindows"
    Write-Host ""
    return
}

Write-Host "Starting DevFlow..." -ForegroundColor Cyan

# Clear file if provided
if ($clear) {
    if (Test-Path $clear) {
        Remove-Item $clear -Force
        Write-Host "Cleared: $clear" -ForegroundColor Yellow
    } else {
        Write-Host "File not found: $clear"
    }
}

# Core Flutter pipeline
Write-Host "flutter clean"
flutter clean

Write-Host "flutter pub get"
flutter pub get

Write-Host "Generating l10n"
flutter gen-l10n

Write-Host "Running build_runner"
dart run build_runner build --delete-conflicting-outputs

# Build section
if ($buildWindows) {
    Write-Host "Building Windows..."
    flutter build windows
}

if ($buildMobile) {
    Write-Host "Building Mobile (APK)..."
    flutter build apk
}

if ($buildWeb) {
    Write-Host "Building Web..."
    flutter build web
}

# Run section
if ($runWindows) {
    Write-Host "Running Windows..."
    flutter run -d windows
}

if ($runMobile) {
    Write-Host "Running Mobile..."
    flutter run -d android
}

if ($runWeb) {
    Write-Host "Running Web..."
    flutter run -d chrome
}

Write-Host "DevFlow Complete!" -ForegroundColor Green
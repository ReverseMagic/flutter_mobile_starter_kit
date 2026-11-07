$ErrorActionPreference = "Stop"

$projectRoot = (Get-Location).Path
$requiredFiles = @("pubspec.yaml", "lib", "test", ".fvmrc")

foreach ($requiredFile in $requiredFiles) {
    if (-not (Test-Path (Join-Path $projectRoot $requiredFile))) {
        throw "Run this script from the repository root. Missing: $requiredFile"
    }
}

if ((Test-Path (Join-Path $projectRoot "android")) -or
    (Test-Path (Join-Path $projectRoot "ios"))) {
    throw "Android or iOS already exists. This script will not overwrite existing native projects."
}

if (-not (Get-Command fvm -ErrorAction SilentlyContinue)) {
    throw "FVM is required. Install FVM, then run 'fvm install' from the repository root."
}

fvm install
fvm flutter --version

$backupRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("flutter-starter-backup-" + [guid]::NewGuid())
New-Item -ItemType Directory -Path $backupRoot | Out-Null

$preservePaths = @(
    "AGENTS.md",
    "README.md",
    ".gitignore",
    ".fvmrc",
    "analysis_options.yaml",
    "docs",
    "l10n.yaml",
    "lib",
    "pubspec.yaml",
    "test",
    "tool",
    ".github"
)

try {
    foreach ($relativePath in $preservePaths) {
        $sourcePath = Join-Path $projectRoot $relativePath
        if (Test-Path $sourcePath) {
            $backupPath = Join-Path $backupRoot $relativePath
            $backupParent = Split-Path -Parent $backupPath
            New-Item -ItemType Directory -Path $backupParent -Force | Out-Null
            Copy-Item -Path $sourcePath -Destination $backupPath -Recurse -Force
        }
    }

    fvm flutter create --overwrite --platforms=android,ios --org com.example --project-name mobile_starter --no-pub .

    foreach ($relativePath in $preservePaths) {
        $backupPath = Join-Path $backupRoot $relativePath
        if (Test-Path $backupPath) {
            $targetPath = Join-Path $projectRoot $relativePath
            if (Test-Path $targetPath) {
                Remove-Item -Path $targetPath -Recurse -Force
            }
            $targetParent = Split-Path -Parent $targetPath
            if ($targetParent) {
                New-Item -ItemType Directory -Path $targetParent -Force | Out-Null
            }
            Copy-Item -Path $backupPath -Destination $targetPath -Recurse -Force
        }
    }

    Write-Host "Android and iOS project scaffolding generated."
    Write-Host "Next: fvm flutter pub get; fvm flutter gen-l10n; fvm flutter analyze; fvm flutter test"
}
finally {
    if (Test-Path $backupRoot) {
        Remove-Item -Path $backupRoot -Recurse -Force
    }
}

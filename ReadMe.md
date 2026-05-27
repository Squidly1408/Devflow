# DevFlow

DevFlow is a lightweight PowerShell CLI utility built for Flutter developers who are tired of repeatedly typing the same setup, generation, build, and run commands every time they work on a project.

The tool automates the standard Flutter development workflow into a single command while also supporting optional build targets, run targets, and file clearing.

---

# Features

- Runs the full Flutter setup pipeline
- Supports Windows, Android, and Web workflows
- Optional file clearing before execution
- Simple PowerShell integration
- Works from any Flutter project directory
- Easy to expand with additional automation

---

# Default Workflow

DevFlow automatically runs the following commands:

```bash
flutter clean
flutter pub get
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
```

---

# Installation

## 1. Create the Script

Create a file called:

```plaintext
devflow.ps1
```

Paste your DevFlow script into the file.

---

## 2. Add DevFlow to PowerShell

Open your PowerShell profile:

```powershell
notepad $PROFILE
```

Add the following function:

```powershell
function devflow {
    param($args)
    & "C:\Users\LucasNewman\Development\SDKs\Custom_Scripts\devflow.ps1" @args
}
```

Replace the path with the actual location of your script.

---

## 3. Reload PowerShell

```powershell
. $PROFILE
```

---

# Usage

## Run Default Workflow

```powershell
devflow
```

---

# Build Commands

## Build Windows

```powershell
devflow -buildWindows
```

## Build Android APK

```powershell
devflow -buildMobile
```

## Build Web

```powershell
devflow -buildWeb
```

---

# Run Commands

## Run Windows

```powershell
devflow -runWindows
```

## Run Android

```powershell
devflow -runMobile
```

## Run Web

```powershell
devflow -runWeb
```

---

# Clear Files Before Running

Useful for clearing databases, caches, or generated files.

```powershell
devflow -clear "database/test_db1.sqlite"
```

---

# Combined Examples

## Clear Database + Build Windows

```powershell
devflow -clear "database/test_db1.sqlite" -buildWindows
```

## Build and Run Web

```powershell
devflow -buildWeb -runWeb
```

## Full Android Workflow

```powershell
devflow -clear "database/test_db1.sqlite" -buildMobile -runMobile
```

---

# Requirements

- Windows
- PowerShell
- Flutter SDK
- Dart SDK

Your Flutter project should also support:

- `build_runner`
- Flutter localization (`gen-l10n`)

---

# PowerShell Execution Policy

If PowerShell blocks the script, run:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

# Example Workflow

```powershell
devflow -clear "database/test_db1.sqlite" -buildWindows -runWindows
```

This will:

1. Remove the specified file
2. Run Flutter clean
3. Fetch dependencies
4. Generate localization files
5. Run build_runner
6. Build the Windows application
7. Launch the application

---

# Author

Lucas Newman

Software Engineering (Honours) Student  
Software Developer at SAPHI Engineering

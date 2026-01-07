# WhisperX Environment Setup Script
# Run this in PowerShell to create a clean environment for WhisperX

Write-Host "=" -NoNewline -ForegroundColor Cyan
    Write-Host ("=" * 59) -ForegroundColor Cyan
Write-Host "WhisperX Environment Setup" -ForegroundColor Green
Write-Host ("=" * 60) -ForegroundColor Cyan

# Step 1: Create virtual environment
Write-Host "`n[1/5] Creating virtual environment..." -ForegroundColor Yellow
python -m venv whisperx_env

# Step 2: Activate environment
Write-Host "[2/5] Activating environment..." -ForegroundColor Yellow
& .\whisperx_env\Scripts\Activate.ps1

# Step 3: Upgrade pip
Write-Host "[3/5] Upgrading pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip

# Step 4: Install compatible PyTorch
Write-Host "[4/5] Installing PyTorch (CPU version)..." -ForegroundColor Yellow
pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cpu

# Step 5: Install WhisperX and dependencies
Write-Host "[5/5] Installing WhisperX and dependencies..." -ForegroundColor Yellow
pip install git+https://github.com/m-bain/whisperx.git
pip install pydub

Write-Host "`n" -NoNewline
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "`nTo use this environment:" -ForegroundColor Yellow
Write-Host "1. Run: .\whisperx_env\Scripts\Activate.ps1" -ForegroundColor White
Write-Host "2. Open VS Code and select this Python interpreter" -ForegroundColor White
Write-Host "3. Run your notebook" -ForegroundColor White
Write-Host "`nEnvironment location: whisperx_env\" -ForegroundColor Cyan

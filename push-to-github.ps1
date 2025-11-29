# Git Push Script for Employee Leave Management System

Write-Host "🚀 GitHub Push Setup Script" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
Write-Host "Checking Git installation..." -ForegroundColor Yellow
$gitVersion = git --version 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Git is not installed. Please install Git from https://git-scm.com/" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Git is installed: $gitVersion" -ForegroundColor Green
Write-Host ""

# Check if already a git repository
if (Test-Path .git) {
    Write-Host "✅ Git repository already initialized" -ForegroundColor Green
} else {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Git repository initialized" -ForegroundColor Green
}
Write-Host ""

# Ask for GitHub username
Write-Host "📝 Please enter your GitHub username:" -ForegroundColor Cyan
$githubUser = Read-Host

# Ask for repository name
Write-Host "📝 Please enter repository name (default: employee-leave-management):" -ForegroundColor Cyan
$repoName = Read-Host
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "employee-leave-management"
}
Write-Host ""

# Show repository URL
$repoUrl = "https://github.com/$githubUser/$repoName.git"
Write-Host "Repository URL will be: $repoUrl" -ForegroundColor Yellow
Write-Host ""

# Ask for confirmation
Write-Host "⚠️  Before proceeding, please:" -ForegroundColor Yellow
Write-Host "1. Create a new repository on GitHub: https://github.com/new" -ForegroundColor White
Write-Host "2. Repository name: $repoName" -ForegroundColor White
Write-Host "3. Make it Public or Private (your choice)" -ForegroundColor White
Write-Host "4. Do NOT initialize with README (we already have one)" -ForegroundColor White
Write-Host ""
Write-Host "Have you created the repository? (Y/N):" -ForegroundColor Cyan
$confirm = Read-Host

if ($confirm -ne "Y" -and $confirm -ne "y") {
    Write-Host "❌ Please create the repository first, then run this script again." -ForegroundColor Red
    exit 0
}
Write-Host ""

# Check git config
Write-Host "Checking Git configuration..." -ForegroundColor Yellow
$userName = git config user.name
$userEmail = git config user.email

if ([string]::IsNullOrWhiteSpace($userName)) {
    Write-Host "📝 Enter your name for Git commits:" -ForegroundColor Cyan
    $userName = Read-Host
    git config --global user.name "$userName"
}

if ([string]::IsNullOrWhiteSpace($userEmail)) {
    Write-Host "📝 Enter your email for Git commits:" -ForegroundColor Cyan
    $userEmail = Read-Host
    git config --global user.email "$userEmail"
}

Write-Host "✅ Git configured with:" -ForegroundColor Green
Write-Host "   Name: $userName" -ForegroundColor White
Write-Host "   Email: $userEmail" -ForegroundColor White
Write-Host ""

# Add all files
Write-Host "Adding files to Git..." -ForegroundColor Yellow
git add .
Write-Host "✅ Files added" -ForegroundColor Green
Write-Host ""

# Show status
Write-Host "Git Status:" -ForegroundColor Yellow
git status --short
Write-Host ""

# Commit
Write-Host "Creating initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: Employee Leave Management System

- Full-stack MERN application
- Employee and Manager dashboards
- JWT authentication
- Leave balance management
- Beautiful UI with animations"

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Files committed" -ForegroundColor Green
} else {
    Write-Host "⚠️  Commit failed or no changes to commit" -ForegroundColor Yellow
}
Write-Host ""

# Set main branch
Write-Host "Setting default branch to 'main'..." -ForegroundColor Yellow
git branch -M main
Write-Host "✅ Branch set to main" -ForegroundColor Green
Write-Host ""

# Add remote
Write-Host "Adding remote repository..." -ForegroundColor Yellow
$existingRemote = git remote get-url origin 2>$null
if ($existingRemote) {
    Write-Host "⚠️  Remote 'origin' already exists: $existingRemote" -ForegroundColor Yellow
    Write-Host "Do you want to replace it? (Y/N):" -ForegroundColor Cyan
    $replace = Read-Host
    if ($replace -eq "Y" -or $replace -eq "y") {
        git remote remove origin
        git remote add origin $repoUrl
        Write-Host "✅ Remote updated" -ForegroundColor Green
    }
} else {
    git remote add origin $repoUrl
    Write-Host "✅ Remote added" -ForegroundColor Green
}
Write-Host ""

# Push to GitHub
Write-Host "🚀 Pushing to GitHub..." -ForegroundColor Cyan
Write-Host "You may need to enter your GitHub credentials" -ForegroundColor Yellow
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "🎉 SUCCESS! Project pushed to GitHub!" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "📍 Your repository is now available at:" -ForegroundColor Cyan
    Write-Host "   $repoUrl" -ForegroundColor White
    Write-Host ""
    Write-Host "🔗 View it online at:" -ForegroundColor Cyan
    Write-Host "   https://github.com/$githubUser/$repoName" -ForegroundColor White
    Write-Host ""
    Write-Host "📝 Next steps:" -ForegroundColor Yellow
    Write-Host "1. Add screenshots to your README" -ForegroundColor White
    Write-Host "2. Update README with your contact info" -ForegroundColor White
    Write-Host "3. Share your project!" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ Push failed. Common issues:" -ForegroundColor Red
    Write-Host "1. Authentication failed - Use Personal Access Token" -ForegroundColor Yellow
    Write-Host "   Go to: GitHub → Settings → Developer settings → Personal access tokens" -ForegroundColor White
    Write-Host "2. Repository doesn't exist - Create it on GitHub first" -ForegroundColor Yellow
    Write-Host "3. Repository name mismatch - Check the repository name" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "For Personal Access Token:" -ForegroundColor Cyan
    Write-Host "- Go to: https://github.com/settings/tokens" -ForegroundColor White
    Write-Host "- Generate new token (classic)" -ForegroundColor White
    Write-Host "- Select scopes: repo (all)" -ForegroundColor White
    Write-Host "- Use token as password when pushing" -ForegroundColor White
    Write-Host ""
}

Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

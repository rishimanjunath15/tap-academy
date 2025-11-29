# Quick GitHub Push Guide

## Method 1: Using the PowerShell Script (Recommended)

1. Open PowerShell in the project root directory
2. Run: `.\push-to-github.ps1`
3. Follow the interactive prompts

## Method 2: Manual Commands

### Step 1: Create GitHub Repository
1. Go to https://github.com/new
2. Repository name: `employee-leave-management`
3. Choose Public or Private
4. **DO NOT** initialize with README
5. Click "Create repository"

### Step 2: Configure Git (First time only)
```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Push to GitHub
```powershell
# Initialize git repository
git init

# Add all files
git add .

# Commit files
git commit -m "Initial commit: Employee Leave Management System"

# Set main branch
git branch -M main

# Add remote repository (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/employee-leave-management.git

# Push to GitHub
git push -u origin main
```

## Authentication

### Using Personal Access Token (Recommended)
1. Go to https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Select scopes: **repo** (full control)
4. Generate token and **copy it**
5. When pushing, use token as password

### Using GitHub CLI
```powershell
# Install GitHub CLI
winget install GitHub.cli

# Authenticate
gh auth login

# Push
git push -u origin main
```

## Troubleshooting

### Error: "remote origin already exists"
```powershell
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/employee-leave-management.git
```

### Error: "failed to push some refs"
```powershell
# Force push (only if you're sure)
git push -u origin main --force
```

### Error: "Authentication failed"
- Use Personal Access Token as password
- Or use GitHub CLI: `gh auth login`

## Verify Success
After pushing, visit:
https://github.com/YOUR_USERNAME/employee-leave-management

Your code should be visible!

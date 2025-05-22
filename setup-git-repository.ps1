# PowerShell script to set up Git repository for ZenAgric project

# Check if .git directory already exists
if (Test-Path ".git") {
    Write-Host "Git repository is already initialized in this directory."
    exit
}

# Initialize the Git repository
Write-Host "Initializing Git repository..."
git init

# Add all files to the staging area
Write-Host "Adding files to staging area..."
git add .

# Prompt for Git user configuration if not already set
$gitUserName = git config --global user.name
$gitUserEmail = git config --global user.email

if ([string]::IsNullOrEmpty($gitUserName)) {
    $userName = Read-Host "Enter your name for Git configuration"
    git config --global user.name "$userName"
}

if ([string]::IsNullOrEmpty($gitUserEmail)) {
    $userEmail = Read-Host "Enter your email for Git configuration"
    git config --global user.email "$userEmail"
}

# Create the initial commit
Write-Host "Creating initial commit..."
git commit -m "Initial commit for ZenAgric project"

Write-Host "`nGit repository has been initialized with an initial commit."
Write-Host "`nNext steps:"
Write-Host "1. Create a new repository on GitHub at https://github.com/new"
Write-Host "2. Run the following commands to connect to your GitHub repository:"
Write-Host "   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git"
Write-Host "   git branch -M main"
Write-Host "   git push -u origin main"
Write-Host "`nReplace YOUR-USERNAME and YOUR-REPO-NAME with your actual GitHub username and repository name."

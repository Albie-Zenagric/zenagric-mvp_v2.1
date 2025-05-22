# PowerShell script to update the MCP settings
$settingsFilePath = "c:\Users\albye\AppData\Roaming\Code\User\globalStorage\saoudrizwan.claude-dev\settings\cline_mcp_settings.json"

# Read the current settings file
$settings = Get-Content -Path $settingsFilePath -Raw | ConvertFrom-Json

# Define new Supabase server configuration
$newServer = @{
    command = "node"
    args = @("C:/Users/albye/OneDrive/Documents/Cline/MCP/supabase-server/build/index.js")
    env = @{
        SUPABASE_URL = "https://qkfpmkrqwvssakvdmwtz.supabase.co"
        SUPABASE_SERVICE_ROLE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFrZnBta3Jxd3Zzc2FrdmRtd3R6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0Nzg5Mzc1MSwiZXhwIjoyMDYzNDY5NzUxfQ.eAb-pGAHJDP_kE9cWisczsi6HGftmA2tFNSFgZ-r048"
    }
    disabled = $false
    autoApprove = @()
}

# Add the new server to the mcpServers property (or update if it already exists)
if (-not $settings.mcpServers) {
    $settings.mcpServers = @{}
}
$settings.mcpServers | Add-Member -MemberType NoteProperty -Name "zenagric-supabase" -Value $newServer -Force

# Convert back to JSON and save
$settingsJson = $settings | ConvertTo-Json -Depth 10
Set-Content -Path $settingsFilePath -Value $settingsJson

Write-Host "MCP settings updated successfully!"

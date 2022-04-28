function Resolve-SidToName {
    <#
    .SYNOPSIS
    Resolves the username of a SID.

    .DESCRIPTION
    Accepts a SID and resolves it to a Windows or AD username.

    .PARAMETER Sid
    Specifies the SID to resolve.

    .EXAMPLE
    Resolve-SidToName -Sid (whoami /logonid)
    #>
    [CmdletBinding()]
    param (
        # Specifies the SID of a Windows identity.
        [Parameter(Mandatory)]
        [string]
        $Sid
    )

    process {
        try {
            $objSID = New-Object System.Security.Principal.SecurityIdentifier($Sid)
            $objSID.Translate([System.Security.Principal.NTAccount]).Value
        } catch {
            Write-Warning "Unable to resolve SID to username"
        }
    }
}

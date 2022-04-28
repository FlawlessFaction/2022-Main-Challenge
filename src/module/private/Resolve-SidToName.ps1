function Resolve-SidToName {
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

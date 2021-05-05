<#
.DESCRIPTION
    A module for PowerShell to generate passwords that can accept the terms of the company's complexity requirements.
    It asks for a name with each passwords so if you need to generate multiple passwords, you can identify them easily.
.EXAMPLE
    new-password -Name User -Length 12
.INPUTS
    -name       REQUIRED
    -length     REQUIRED
.OUTPUTS
    Accountname: User
    Password: T707b/Mtf#pM
.NOTES
    Author: Renaldo Breidel
    Date:  05-05-2021
#>

function New-Password {
    [CmdletBinding()]        
Param
 (
    [parameter(Mandatory=$true)]
    [String]$Name,
    [parameter(Mandatory=$true)]
    [int]$Length
   )
    $characters = "1234567890!@#$%&*()_+-=[];\/{}:|<>?qazwsxedcrfvtgbyhnujmikolpQAZWSXEDCRFVTGBYHNUJMIKOLP"
    $random = 1..$Length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs = ""
    
    $returnname = $Name
    $returnchar = $characters[$random]

    return "Accountname: $returnname", "Password: $returnchar"
}
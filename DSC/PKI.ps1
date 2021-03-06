#
# provisionvm.ps1
#
Configuration rootca
{

   param
   (
        [Parameter(Mandatory)]
        [String]$DomainName,

        [Parameter(Mandatory)]
        [System.Management.Automation.PSCredential]$Admincreds

    )
    
    Import-DscResource -ModuleName xAdcsDeployment, PSDesiredStateConfiguration

	# Get the domain credentials
    # xADCSCertificationAuthority requires this
    [System.Management.Automation.PSCredential ]$DomainCreds = New-Object System.Management.Automation.PSCredential ("${DomainName}\$($Admincreds.UserName)", $Admincreds.Password)

    Node localhost {

        # Install the ADCS Certificate Authority
        WindowsFeature ADCSCA {
            Name = 'ADCS-Cert-Authority'
            Ensure = 'Present'
        }
        
        # Configure the CA as Standalone Root CA
        xADCSCertificationAuthority ConfigCA
        {
            Ensure = 'Present'
            Credential = $DomainCreds
            CAType = 'EnterpriseRootCA'
			CACommonName = $Node.CACommonName
            CADistinguishedNameSuffix = $Node.CADistinguishedNameSuffix
            ValidityPeriod = 'Years'
            ValidityPeriodUnits = 20
            CryptoProviderName = 'RSA#Microsoft Software Key Storage Provider'
            HashAlgorithmName = 'SHA256'
            KeyLength = 4096
            DependsOn = '[WindowsFeature]ADCSCA' 
        }

            WindowsFeature RSAT-ADCS 
        { 
            Ensure = 'Present' 
            Name = 'RSAT-ADCS' 
            DependsOn = '[WindowsFeature]ADCSCA' 
        } 
        WindowsFeature RSAT-ADCS-Mgmt 
        { 
            Ensure = 'Present' 
            Name = 'RSAT-ADCS-Mgmt' 
            DependsOn = '[WindowsFeature]ADCSCA' 
        } 
     }
  }

 #$ConfigData = @{             
 #   AllNodes = @(             
 #       @{             
 #           Nodename = 'localhost'          
 #           PsDscAllowPlainTextPassword = $true
 #           PSDscAllowDomainUser = $true
 #         LocalAdminPassword = 'Test12341234'
 #         AdminLogin = "adadmin@ad.contoso.com"
 #       }                      
 #   )            
#}

# Generate MOF
# rootca -ConfigurationData $ConfigData
# Run config on local host
# Start-DscConfiguration -ComputerName localhost -Wait -Force -Path C:\temp\rootca\ -Verbose
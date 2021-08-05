# Inputs from the web application
param([String]$name)
    
# Loads the Quest Cmdlets
Add-PSSnapin Quest.ActiveRoles.ADManagement -EA SilentlyContinue 


function Check-Mailbox{
    param([String]$name)

    $mailbox = (Get-qadobject $name | ?{($_.name -eq $name)-or($_.samaccountname -eq $name)})
    $usercheck = $mailbox.lastname

    if ($mailbox)
    {
        if ($mailbox.type -eq "user")
        {

            if($mailbox.email)
            {
                if($usercheck)
                {
                    $result = "$mailbox seems to be a user's mailbox. Please ensure that the mailbox is a shared mailbox."
                }
                else
                {
                    if($mailbox.accountisdisabled)
                    {
                        $result = "Mailbox found - $name"
                    }
                    else
                    {
                        $result = "$mailbox is activated in AD. Please ensure that the mailbox is a shared mailbox."
                    }
                }
                
               
            }
            else
            {
                $result = "$mailbox does not have an email address. Please ensure that the mailbox is a shared mailbox."

            }
        }

        else
        {
            $result = "$mailbox is an AD group, not a mailbox."
        }
    }
    else
    {
        $result = "Cannot find $name in Active Directory."
    }
   $result | Out-string
}

Check-Mailbox -name $name
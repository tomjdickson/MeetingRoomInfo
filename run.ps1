# Enabling Organiser and Title viewing for all users
# Creating 14/01/19 by Thomas Dickson V01.00.00

# Please ensure you have ran "Set-ExecutionPolicy RemoteSigned" prior to executing this script
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking

# Set the Room name below
$Room = "Room name"
# Do not change the below line
$RoomCalendar = $Room + ":\calendar"

# LimitedDetails (according to https://bit.ly/2zUWqju): View availability data with subject and location
Set-MailboxFolderPermission -AccessRights LimitedDetails -Identity $RoomCalendar -User default

# As it details the below will make the subject of the event the orgaisers name + the event name to allow end users to identify meeting organiser
Set-CalendarProcessing -Identity $Room -AddOrganizerToSubject $true -DeleteComments $false -DeleteSubject $false

Remove-PSSession $Session 
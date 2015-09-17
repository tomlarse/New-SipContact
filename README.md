# New-SipContact
Adding external contacts to the Skype for Business address book

Also contains a version of the script that will create contacts in bulk based on a .csv file.

## Use

`New-SipContact.ps1 -cn "John Spencer" -OUpath "OU=SIPContacts,DC=contoso,DC=com" -sipaddress "john.spencer@litwareinc.com" -displayname "John Displayname Spencer"`

or

`New-SipContactBulk.ps1 -OUpath "OU=SIPContacts,DC=contoso,DC=com" -csv "c:newcontacts.csv"`
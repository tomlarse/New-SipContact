#####################################################################################
# New-SipContactBulk.ps1
#
# Creates a contact object in AD that will be included in Lync/OCS address books.
# 
#
# Passing parameters:
# .\New-SipContactBulk.ps1 -OUpath "OU=SIPContacts,DC=contoso,DC=com" -csv "c:\newcontacts.csv"
#
#
# Written by Tom-Inge Larsen (http://www.codesalot.com)
# 
#####################################################################################
param($OUpath,$csv)

$fullpath= "LDAP://" + $OUpath
$SIPContactOU = [ADSI]$fullpath

$contacts = Import-Csv -path $csv -header "cn","displayName","sipaddress"

foreach ($contact in $contacts) {

    $SIPContact = $SIPContactOU.create("contact", "cn=" + $contact.cn) 
    $SIPContact.Put("Description","SIP Contact Object") 
    $SIPContact.Put("msRTCSIP-PrimaryUserAddress", "sip:" + $contact.sipaddress)
    if ($contact.displayname -ne "") {
        $SIPContact.Put("displayName", $contact.displayName)
    }
    $SIPContact.setInfo()
}
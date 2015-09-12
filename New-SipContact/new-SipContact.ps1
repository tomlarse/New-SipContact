#####################################################################################
# New-SipContact.ps1
#
# Creates a contact object in AD that will be included in Lync/OCS address books.
# 
#
# Passing parameters:
# .\New-SipContact.ps1 -cn "John Spencer" -path "OU=SIPContacts,DC=contoso,DC=com" -sipaddress "john.spencer@litwareinc.com" -displayname "John Displayname Spencer"
#
# Written by Tom-Inge Larsen (http://www.codesalot.com)
# 
#####################################################################################
param($cn,$OUpath,$sipAddress,$displayName="",$telephoneNumber="")

$fullpath= "LDAP://" + $OUpath
$SIPContactOU = [ADSI]$fullpath

$SIPContact = $SIPContactOU.create("contact", "cn=" + $cn) 
$SIPContact.Put("Description","SIP Contact Object") 
$SIPContact.Put("msRTCSIP-PrimaryUserAddress", "sip:" + $sipAddress)
if ($displayName -ne "") {
    $SIPContact.Put("displayName", $displayName)
}
if ($telephoneNumber -ne "") {
 $SIPContact.Put("telephoneNumber", $telephoneNumber)
}
$SIPContact.setInfo()
trigger ContactTrigger on Contact (after insert) 
{
    list<String> contactEmaildomains = new list<String>();
    for(Contact contact:trigger.new)
    {
        contactEmaildomains.add(contact.Email);
    }
    list<Account> accounts = [SELECT Id, 
                                     Email_Domain_Name__c 
                                FROM Account
                               WHERE Email_Domain_Name__c IN :contactEmaildomains];
    Map<String,Account> domainAccountMap = new Map<String,Account>();

    for(Account accItr : accounts)
    {
        domainAccountMap.put(accItr.Email_Domain_Name__c,accItr);
    }
    for(Contact c : trigger.new)
    {
        if(domainAccountMap.containsKey(c.AccountId))
        {
        //c.AccountId = domainAccountMap.get(c.Email).Id;
        //c.AccountId=Account.Id;
            system.debug('WEL');
        }
    }
}
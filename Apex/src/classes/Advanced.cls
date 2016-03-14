public class Advanced 
{
 
    public void retriev()
    {
        list<Contact> contactList = [ SELECT Id , 
                                             Name 
                                        FROM Contact];
        System.debug('The Contact List is : ' + contactList);
 
    }
 
    public void associatedContact()
    {
        list<Account> accountList = [SELECT account.Name,
                                   ( SELECT Contact.FirstName, 
                                            Contact.LastName 
                                       FROM account.contacts) 
                                       FROM account];
        system.debug('The related list of contact with account ' + accountList);
    }
 
    public void insertRecords()
    {
        Contact newContact = new Contact(LastName='Pote',Phone = '1234567890');
        try
        {
            INSERT newContact;
        } 
        catch (DmlException e) 
        {
            system.debug('Error');
        }
  
        Opportunity newOpportunity = new Opportunity(Name='Nikhil',CloseDate =date.parse('05/11/2012'),StageName='Negotiation/Review');
        try
        {
            insert newOpportunity;
        } 
        catch (DmlException e) 
        {
            system.debug('Error');
        }
  
        Account newAccount = new Account(AccountNumber='12345',Description='This record is craeted by DML operation');
        try
        {
            insert newAccount;
        }
        catch (DmlException e) 
        {
            system.debug('Error');
        }
  
        Lead newLead = new Lead(Company='Eternus',Description='This record is created by DML operation');
        try
        {
            insert newLead;
        }
        catch (DmlException e) 
        {
            system.debug('Error');
        }
    }
 
    public void relationship()
    {
        list<Account> accountList = [SELECT account.Name,
                                   ( SELECT Contact.FirstName, 
                                            Contact.LastName 
                                       FROM account.contacts) 
                                       FROM account];
        system.debug('The related list of contact with account ' + accountList);
    }
 
    public void printMap()
    {
        Map<ID, User> userMap = new Map<ID, User>([SELECT ID,
                                                          Username 
                                                     FROM User 
                                                    WHERE IsActive=True]);
        system.debug('UserMap====='+userMap); 
    }
 
 
    public void mapTest()
    { 
        map<String,Account> accountMap = new map<String,Account>([SELECT ID,
                                                                   Name 
                                                              FROM Account]);
        system.debug(accountMap);
  
        map<ID,Account> accMap = new map<ID,Account>([SELECT ID,
                                                             Name 
                                                        FROM Account]);
        system.debug('accMap======'+accMap);
  
    }
}
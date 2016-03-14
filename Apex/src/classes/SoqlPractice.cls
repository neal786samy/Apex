public class SoqlPractice {
    
    public void retriev()
    {
        list<Contact> contactList = [SELECT Id, 
                                            Name 
                                       FROM Contact];
        System.debug('The Contact List is : ' + contactList);
 
    }
 
    public void activeUser()
    {
        Map<Id, User> userMap = new Map<Id, User>([SELECT Id,
                                                          Username 
                                                     FROM User 
                                                    WHERE IsActive=True]);
         
        system.debug(LoggingLevel.ERROR,'UserMap====='+UserMap); 
    }
 
    public void mapTest()
    {
        Map<String,Account> accountMap = new Map<String,Account>([SELECT ID,
                                                                         Name
                                                                    FROM Account]);
        system.debug('accountMap====='+accountMap+'\n');
  
        list<Account> accLst = [SELECT Id, 
                                       Name 
                                 FROM Account];
                                 
        Map<String,Id> accMap = new Map<String,Id> {};
        
        for(Account a : accLst)
        {
            accMap.put(a.name,a.id);
        }
        system.debug('====accMap====='+accMap+'\n');
    }
  
    public void include()
    {
        list<Account> accLst = [SELECT Id,
                                              Name 
                                        FROM Account 
                                       WHERE Enrollment_year__c INCLUDES('2010')];
        system.debug('accLst====='+accLst);
        
        list <Account> accLstForPicVal = [SELECT Id,
                                                 Name 
                                            FROM Account 
                                           WHERE Enrollment_Year__c includes ('2013','2014')];
        system.debug('====accLstForPicVal===='+accLstForPicVal);
    }
  
    public void notIn()
    {
        list<Account> accLst = [SELECT Name,
                                               Phone,
                                               BillingState 
                                          FROM Account 
                                         WHERE (BillingState not in ('Maharashtra','Kerala')) 
                                                order by  BillingState desc  limit 10000];
        system.debug('accLst===='+accLst);
    }
  
    public void isDeleted()
    {
        list<opportunity> oppLst = [SELECT Name,
                                           Id,
                                           Amount,
                                           StageName,
                                           IsDeleted 
                                      FROM Opportunity 
                                     WHERE amount>10000 AND 
                                           (IsDeleted = false OR IsDeleted = true) 
                                           order by  createdDate LIMIT 100 OFFSET 50];
        system.debug('The opportunity List 1 is : ' + oppLst);
  
    }
}
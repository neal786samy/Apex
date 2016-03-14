public class Relationships 
{
    public void ChildToParent1()
  	 {

         list<contact> contactList1 = [SELECT Id,
                                              Name,
                                              Account.Name 
                                         FROM Contact
                                        WHERE Contact.Account.Active__c='Yes' AND Contact.Account.Industry ='Media'];
         System.debug('The contact List 1 is : ' + contactList1);

     }
     
     public void ChildToParent2()
  	 {
  	
   		 list<C__c> contactList = new list<C__c>([SELECT Name , 
   		                                                 ACMD__r.Name, 
   		                                                 BCMD__r.Name 
   		                                            FROM C__c 
   		                                           WHERE Name='John']);
         system.debug('contactList===='+contactList);
   
     }
     
     public void ParentToChild1()
  	 {
  	
   		 list<account> accountList1 = [SELECT id,
   		                                      Name,
   		                                      (SELECT Name 
   		                                         FROM Contacts 
   		                                        WHERE firstName = 'John') 
   		                                 FROM Account 
   		                                WHERE Id IN (SELECT AccountId 
   		                                               FROM Contact 
   		                                              WHERE firstName = 'John')];
   		 System.debug('The account List 1 is : ' + accountList1);
   
     }
     
     public void ParentToChild2()
  	 {
  	
   		 list<account> accountList2 = [SELECT Id,
   		                                      Name,(SELECT Name 
   		                                              FROM Opportunities 
   		                                             WHERE StageName='Closed Won')
   		                                 FROM Account];
   		 System.debug('The account List 2 is : ' + accountList2);
   
     }
     
     public void ParentToChild3()
     {
    
         list<A__c> parentSearch = new list<A__c>([SELECT Id,
                                                          Name, (SELECT Name,
                                                                        ID 
                                                                   FROM Cs__r 
                                                                  WHERE Name LIKE 'John') 
                                                     FROM A__c]);
         //List<A__c> pSearch = new List<A__c>([Select id,name,(Select id,name,BCMD__r.name,BCMD__r.ID From Cs__r where Name LIKE 'Superman' ) From A__c]);
         System.debug('parentSearch====='+parentSearch);
   
     }
     
}
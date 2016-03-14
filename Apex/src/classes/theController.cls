public class theController 
{
    public ApexPages.StandardController stdCtrl {get; set;}
  
    public list<Contact> conts {get; set;}
    public list<Account> lstAcc {get; set;} 
    public theController (ApexPages.StandardController std)
    {
        stdCtrl=std;
        setupContacts();
    }
  
    public void setupContacts()
    {
        conts=[SELECT Id, 
                      Name, 
                      Email, 
                      Phone 
                 FROM Contact 
                WHERE AccountId=:stdCtrl.getId()];
    }
 
    public void setupAccounts()
    {
        lstAcc=[SELECT Id, 
                       Name, 
                       Email__c, 
                       Phone 
                  FROM Account];
    }
}
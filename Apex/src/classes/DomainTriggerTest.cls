@isTest
public class DomainTriggerTest 
{
   	static testmethod void testContactTrigger()
    {
        Contact c =new Contact();
        c.LastName= 'Sonu';  
        c.Email='Ab@gmail.com';
        c.MobilePhone= '2234234';
        insert c;   
        System.assertEquals(c.Lastname, 'Sonu'); 
        
        Account a =new Account();
        a.Name= 'nikhil';  
        a.DomainName__c= 'gmail.com';
        insert a;   
        System.assertEquals(a.DomainName__c, 'gmail.com');              
    }
    
    static testmethod void testContactTrigger_two()
    {
   	    List<Account> AccList =new List <Account>();
        Account ac=new Account(name='abc',DomainName__c='yahoo.com');
	    AccList.add(ac);
	    insert AccList;
	    Contact c =new Contact();
	    c.LastName= 'Sonu';  
	    c.Email='Ab@yahoo.com';
	    c.MobilePhone= '2234234';
	    insert c;   
	    System.assertEquals(c.Lastname, 'Sonu');
    }
    
    static testmethod void testContactTrigger_three()
    {
        List<Account> AccList =new List <Account>();
	    Account ac=new Account(name='abc',DomainName__c='yahoo.com');
	    AccList.add(ac);
	    insert AccList;
	    Contact c =new Contact();
	    c.LastName= 'Sonu';  
	    c.Email='Ab@gmail.com';
	    insert c;   
	    System.assertEquals(c.Lastname, 'Sonu');        
    }
    
    static testmethod void testContactTrigger_four()
    {
        try
        {
	   	    List<Account> AccList =new List <Account>();
	        Account ac=new Account(name='abc',DomainName__c='gmail.com');
	        AccList.add(ac);
	        insert AccList;
	        Contact c =new Contact();
	        
	        c.LastName= 'Sonu';  
	        c.Email=' ';
	        insert c;   
	        System.assertEquals(c.Lastname, 'Sonu');  
        }
        catch(exception e)
        {
            system.debug('Email field cant be empty');
        }
    }
}
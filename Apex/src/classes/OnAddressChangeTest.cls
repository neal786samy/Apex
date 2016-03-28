@isTest
public class OnAddressChangeTest 
{
    static testmethod void onAddressChange()
    {
        list<Account> accountLst=new list<Account>();
        Account acc=new Account();
        acc.ShippingCity='Pune';
        acc.ShippingState='MH';
        acc.ShippingStreet='Camp';
        acc.ShippingCountry='India';
        acc.BillingCity='Pune';      
        acc.BillingState='MH';
        acc.BillingStreet='Camp';
        acc.BillingCountry='India';
        acc.Name='Nikhil';
        acc.Email__c='neal@gmaail.com';
        accountLst.add(acc);
        //test.starttest();
        insert accountLst;
        //test.stoptest();
        
        list<Universal_container__c> ucLstOne=new list<Universal_container__c>();
        Universal_container__c uc=new Universal_container__c();       
        uc.City__c='';      
        uc.State__c='';
        uc.Street__c='';
        uc.Country__c='';  
        uc.Name='Nikhil';    
        ucLstOne.add(uc);  
        insert ucLstOne;    
        
        list<Account> accLst=new list<Account>();
        Account account=new Account();
        account.Id=accountLst[0].id;
        account.ShippingCity='Pune';
        account.BillingCity='Pune'; 
        account.ShippingState='MH';
        account.ShippingStreet='Cam';
        account.ShippingCountry='India';     
        account.BillingState='MH';
        account.BillingStreet='Cam';
        account.BillingCountry='India';
        account.Name='Nikhil';
        account.Email__c='neal@gmaail.com';
        accLst.add(account);
        //test.starttest();
        update accountLst;
        //test.stoptest();
        
        list<Universal_container__c> ucLst=[select BillingAddress_del__c,
                                                   Active__c,
                                                   ShippingAddress_del__c,
                                                   State__c,
                                                   Street__c ,
                                                   City__c,Country__c 
                                              from Universal_container__c];
                                           system.debug('-->'+ucLst);
        system.assertequals(true,ucLst[1].BillingAddress_del__c,'not true');
        system.assertequals(true,ucLst[1].Active__c,'not true');
        system.assertequals(true,ucLst[1].ShippingAddress_del__c,'not true');
        system.assertequals(acc.BillingState,ucLst[1].State__c,'State not matching');
        system.assertequals(acc.BillingStreet,ucLst[1].Street__c,'Street not matching');
        system.assertequals(acc.BillingCity,ucLst[1].City__c,'City not matching');
        system.assertequals(acc.BillingCountry,ucLst[1].Country__c,'Country not matching');
    }
    
}
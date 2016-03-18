public with sharing class ipf
{

    public ipf(ApexPages.StandardSetController controller) {

    }

ApexPages.StandardController con;
account ee;
List<Account> lstaccount = new List<Account>();
List<contact> lstcontacts = new List<contact>();
public ipf(ApexPages.StandardController controller)
{
// employee__c ee=(employee__c)controller.getRecord();
con=controller;
}
public List<contact> getconts()
{
ee=(account)con.getRecord();
lstcontacts.clear();
accIds.clear();
lstaccount.clear();
if(ee.name<>null)
{
lstaccount=[select id,name from Account where name=:ee.Name];
}
for(Integer i=0;i<lstaccount.size();i++)
{
accIds.add(lstaccount[i].Id);
}
lstcontacts =[select id,name,phone,accountId from contact where accountid in : accIds];
return lstcontacts;
}
set<string> accIds = new set<string>();
public pagereference find()
{
return null;
}
}
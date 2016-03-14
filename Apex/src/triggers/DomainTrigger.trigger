trigger DomainTrigger on Contact (before insert) 
{
	DomainTriggerHandler DTH=new DomainTriggerHandler();
   
    DTH.onBeforeInsert();
}
trigger SalesHeaderTrigger on SalesHeader__c (after insert, after update) 
{
    Trigge_Setting__c s = Trigge_Setting__c.getInstance( UserInfo.GetUserID() ); //or Profile
    if( s.Disable_Triggers__c ) return;
    // for loop to iterate the values triggers by operation
    
    list<Case> newCaseList = new list<Case>();
    
    for(SalesHeader__c objsalesHeader : (trigger.newMap).values() ) {
    
        if(objsalesHeader.Status__c =='Open' && objsalesHeader.Pick_status__c == 'Open' && objsalesHeader.Total_Amount__c > 300) {
        
            if (SalesHeader__c.Bill_to_Street__c <> SalesHeader__c.Ship_to_Street__c || 
                SalesHeader__c.Bill_to_City__c <> SalesHeader__c.Ship_to_City__c||
                SalesHeader__c.Bill_to_Postal_Code__c <> SalesHeader__c.Ship_to_Postal_Code__c ||
                SalesHeader__c.Bill_to_State__c <> SalesHeader__c.Ship_to_State__c) {
                
    
                    Case newCase = new Case(Reason = 'Unable to Cross Ship',
                                            Origin = 'Internal',
                                            Priority = 'Medium',
                                            Status = 'new',
                                            Type = 'Unable to Cross Ship');
                        
                    newCaseList.add(newCase);
            }
        }
    }
    
    insert(newCaseList);
    
}
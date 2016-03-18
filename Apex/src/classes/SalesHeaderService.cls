public class SalesHeaderService
{

    public static void caseInsertion(map<ID,SalesHeader__c> objectSalesHeader)
    {
    
         
       list<Case> newCaseList = new list<Case>();
    
       for(SalesHeader__c objsalesHeader : (objectSalesHeader).values() )            // for loop to iterate the values of triggers by operation
       {    
    
        if(objsalesHeader.Status__c =='Open' && objsalesHeader.Pick_status__c == 'Open' && objsalesHeader.Total_Amount__c > 300) 
        {
            if (objsalesHeader.Bill_to_Street__c <> objsalesHeader.Ship_to_Street__c || 
                objsalesHeader.Bill_to_City__c <> objsalesHeader.Ship_to_City__c||
                objsalesHeader.Bill_to_Postal_Code__c <> objsalesHeader.Ship_to_Postal_Code__c ||
                objsalesHeader.Bill_to_State__c <> objsalesHeader.Ship_to_State__c)
            {
                
                 Case newCase = new Case();
                    
                 newCase.AccountId = objsalesHeader.AccountLookup__c;
                 newCase.ContactId = objsalesHeader.ContactLookup__c;
                 //newCase.RecordType = Assignment;
                 //newCase.Owner = Unable_to_crossship;
                 newCase.Status='Working'; 
                 newCase.Origin ='Internal';
                 newCase.Subject='Unable to ship';
                 newCase.Reason ='Unable to cross ship';
                 newCase.Type = 'Unable to Cross Ship';
                 newCase.Priority = 'Medium';
                 newCase.Open_Sales_Order__c = objsalesHeader.Id ;
                        
                 newCaseList.add(newCase);
                    
            }//End if
        }//end if
    }//end for    
    
    insert(newCaseList);

   }//Method End

}
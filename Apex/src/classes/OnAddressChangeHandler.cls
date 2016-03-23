public class OnAddressChangeHandler 
{
    public void onBeforeUpdate(list<account> accList,list<account> accListOld)
    {
        
        Map<Id, Account> acctsWithNewAddresses = new Map<Id, Account>();
    
        //system.debug('-->');                        
    
        for (Integer i = 0; i < accList.size(); i++) 
        {
              if(((accList[i].BillingCity == accList[i].ShippingCity))
                                               
                && ((accList[i].BillingCountry == accList[i].ShippingCountry))
                                                    
                && ((accList[i].BillingPostalCode == accList[i].ShippingPostalCode))
                                                    
                && ((accList[i].BillingState == accList[i].ShippingState))
                                                    
                && ((accList[i].BillingStreet == accList[i].ShippingStreet)))
            {   
             
                Universal_container__c cont = new Universal_container__c();
                cont.BillingAddress_del__c=True;
                cont.Active__c=True;
                cont.ShippingAddress_del__c=True;
                cont.State__c =accList[0].BillingState;
                cont.Street__c = accList[0].BillingStreet;
                cont.City__c = accList[0].BillingCity;
                cont.Country__c = accList[0].BillingCountry;          
                cont.AccountAddressLookup__c = accList[0].ID;
                insert cont;
                                        
            }   
             if(((accListOld[i].BillingCity != accList[i].BillingCity)&&(accListOld[i].ShippingCity != accList[i].ShippingCity))
                                               
                || ((accListOld[i].BillingCountry != accList[i].BillingCountry)&&(accListOld[i].ShippingCountry != accList[i].ShippingCountry))
                                                    
                || ((accListOld[i].BillingPostalCode != accList[i].BillingPostalCode)&&(accListOld[i].ShippingPostalCode != accList[i].ShippingPostalCode))
                                                    
                || ((accListOld[i].BillingState != accList[i].BillingState)&&(accListOld[i].ShippingState != accList[i].ShippingState))
                                                    
                || ((accListOld[i].BillingStreet != accList[i].BillingStreet)&&(accListOld[i].ShippingStreet != accList[i].ShippingStreet)))
            {
                Universal_container__c cont = new Universal_container__c();
                cont.BillingAddress_del__c=True;
                cont.Active__c=True;
                cont.State__c = accList[0].BillingState;
                cont.Street__c = accList[0].BillingStreet;
                cont.City__c = accList[0].BillingCity;
                cont.Country__c = accList[0].BillingCountry;          
                cont.AccountAddressLookup__c = accList[0].ID;          
                insert cont;
                Universal_container__c conts = new Universal_container__c();
                conts.ShippingAddress_del__c=True;
                conts.Active__c=True;
                conts.State__c = accList[0].ShippingState;
                conts.Street__c = accList[0].ShippingStreet;
                conts.City__c =accList[0].ShippingCity;
                conts.Country__c = accList[0].ShippingCountry;          
                conts.AccountAddressLookup__c = accList[0].ID;            
                insert conts;  
                                        
            }     
            else if(((accListOld[i].ShippingCity != accList[i].ShippingCity))
                                               
                || ((accListOld[i].ShippingCountry != accList[i].ShippingCountry))
                                                    
                || ((accListOld[i].ShippingPostalCode != accList[i].ShippingPostalCode))
                                                    
                || ((accListOld[i].ShippingState != accList[i].ShippingState))
                                                    
                || ((accListOld[i].ShippingStreet != accList[i].ShippingStreet)))
            {            
                Universal_container__c cont = new Universal_container__c();
                cont.ShippingAddress_del__c=True;
                cont.Active__c=True;
                cont.State__c = accList[0].ShippingState;
                cont.Street__c = accList[0].ShippingStreet;
                cont.City__c =accList[0].ShippingCity;
                cont.Country__c = accList[0].ShippingCountry;          
                cont.AccountAddressLookup__c = accList[0].ID;
                insert cont;
                                        
            }
            else if(((accListOld[i].BillingCity != accList[i].BillingCity))
                                               
                || ((accListOld[i].BillingCountry != accList[i].BillingCountry))
                                                    
                || ((accListOld[i].BillingPostalCode != accList[i].BillingPostalCode))
                                                    
                || ((accListOld[i].BillingState != accList[i].BillingState))
                                                    
                || ((accListOld[i].BillingStreet != accList[i].BillingStreet)))
            {
                Universal_container__c cont = new Universal_container__c();
                cont.BillingAddress_del__c=True;
                cont.Active__c=True;
                cont.State__c = accList[0].BillingState;
                cont.Street__c = accList[0].BillingStreet;
                cont.City__c = accList[0].BillingCity;
                cont.Country__c = accList[0].BillingCountry;          
                cont.AccountAddressLookup__c = accList[0].ID;
                insert cont;
                                        
            }     
        }
    }
}
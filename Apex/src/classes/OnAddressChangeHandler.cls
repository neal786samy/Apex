public class OnAddressChangeHandler 
{
    public void onBeforeUpdate(list<account> accList,list<account> accListOld)
    {
        List<Universal_container__c> lstToAdd = New List<Universal_container__c>();
        Map<Id, Account> acctsWithNewAddresses = new Map<Id, Account>();
        List<Universal_container__c> lstToUpdate = New List<Universal_container__c>();
        List<Universal_container__c> listUS = new List<Universal_container__c>([SELECT Active__c,BillingAddress_del__c,ShippingAddress_del__c,AccountAddressLookup__c,City__c,Country__c,Street__c,State__c
                                                                                FROM Universal_container__c
                                                                                WHERE AccountAddressLookup__c IN: trigger.new]);
        List<String> strLst =new List<String>();
        for(Universal_container__c uni1 : listUS ) 
        {
            strLst.add(uni1.City__c+uni1.Country__c+uni1.Street__c+uni1.State__c);
        }  
        Map<String,Universal_container__c> mapToCheckDup= new Map<String, Universal_container__c>();                                                         
        Map<Id, List<Universal_container__c>> mapLstAccId= new Map<Id, List<Universal_container__c>>(); 
        //mapToCheckDup.put(strLst,Universal_container__c);     
        //system.debug('-->');                        
    
        for (Integer i = 0; i < accList.size(); i++) 
        {
              if(((accList[i].BillingCity == accList[i].ShippingCity))&& ((accList[i].BillingCountry == accList[i].ShippingCountry))
                 && ((accList[i].BillingPostalCode == accList[i].ShippingPostalCode))&& ((accList[i].BillingState == accList[i].ShippingState))
                 && ((accList[i].BillingStreet == accList[i].ShippingStreet)))
            {   
                //mapToCheckDup.containskey();              
                    
                Universal_container__c cont = new Universal_container__c();
                cont.BillingAddress_del__c=True;               
                cont.ShippingAddress_del__c=True;
                cont.Active__c=True;
                cont.State__c =accList[0].BillingState;
                cont.Street__c = accList[0].BillingStreet;
                cont.City__c = accList[0].BillingCity;
                cont.Country__c = accList[0].BillingCountry;          
                cont.AccountAddressLookup__c = accList[0].ID;
                lstToAdd.add(cont);
                                        
            }   
             else if(((accListOld[i].BillingCity != accList[i].BillingCity)&&(accListOld[i].ShippingCity != accList[i].ShippingCity))|| ((accListOld[i].BillingCountry != accList[i].BillingCountry)&&(accListOld[i].ShippingCountry != accList[i].ShippingCountry))|| ((accListOld[i].BillingPostalCode != accList[i].BillingPostalCode)&&(accListOld[i].ShippingPostalCode != accList[i].ShippingPostalCode))|| ((accListOld[i].BillingState != accList[i].BillingState)&&(accListOld[i].ShippingState != accList[i].ShippingState))|| ((accListOld[i].BillingStreet != accList[i].BillingStreet)&&(accListOld[i].ShippingStreet != accList[i].ShippingStreet)))
            {
                Universal_container__c cont = new Universal_container__c();
                cont.BillingAddress_del__c=True;
                cont.Active__c=True;
                cont.State__c = accList[0].BillingState;
                cont.Street__c = accList[0].BillingStreet;
                cont.City__c = accList[0].BillingCity;
                cont.Country__c = accList[0].BillingCountry;          
                cont.AccountAddressLookup__c = accList[0].ID;          
                lstToAdd.add (cont);
                Universal_container__c conts = new Universal_container__c();
                conts.ShippingAddress_del__c=True;
                conts.Active__c=True;
                conts.State__c = accList[0].ShippingState;
                conts.Street__c = accList[0].ShippingStreet;
                conts.City__c =accList[0].ShippingCity;
                conts.Country__c = accList[0].ShippingCountry;          
                conts.AccountAddressLookup__c = accList[0].ID;            
                lstToAdd.add (conts); 
                                        
            }     
            else if(((accListOld[i].ShippingCity != accList[i].ShippingCity))|| ((accListOld[i].ShippingCountry != accList[i].ShippingCountry))|| ((accListOld[i].ShippingPostalCode != accList[i].ShippingPostalCode))|| ((accListOld[i].ShippingState != accList[i].ShippingState))|| ((accListOld[i].ShippingStreet != accList[i].ShippingStreet)))
            {            
                Universal_container__c cont = new Universal_container__c();
                cont.ShippingAddress_del__c=True;
                cont.Active__c=True;
                cont.State__c = accList[0].ShippingState;
                cont.Street__c = accList[0].ShippingStreet;
                cont.City__c =accList[0].ShippingCity;
                cont.Country__c = accList[0].ShippingCountry;          
                cont.AccountAddressLookup__c = accList[0].ID;
                lstToAdd.add (cont);
                                        
            }
            else if(((accListOld[i].BillingCity != accList[i].BillingCity))|| ((accListOld[i].BillingCountry != accList[i].BillingCountry))|| ((accListOld[i].BillingPostalCode != accList[i].BillingPostalCode))|| ((accListOld[i].BillingState != accList[i].BillingState))|| ((accListOld[i].BillingStreet != accList[i].BillingStreet)))
            {
                Universal_container__c cont = new Universal_container__c();
                cont.BillingAddress_del__c=True;
                cont.Active__c=True;
                cont.State__c = accList[0].BillingState;
                cont.Street__c = accList[0].BillingStreet;
                cont.City__c = accList[0].BillingCity;
                cont.Country__c = accList[0].BillingCountry;          
                cont.AccountAddressLookup__c = accList[0].ID;
                lstToAdd.add (cont);
                                        
            }     
            insert lstToAdd;
        }
         if(!lstToAdd .isEmpty())
        {   
            for(Universal_container__c objUC:listUS)
            {
                if(mapLstAccId.containskey(objUC.AccountAddressLookup__c))
                {
                    mapLstAccId.get(objUC.AccountAddressLookup__c).add(objUC);
                }
                else
                {
                    mapLstAccId.put(objUC.AccountAddressLookup__c,new List<Universal_container__c>{objUC});
                }
            }
            for(Id keyId:mapLstAccId.keyset())
            {
                for(Universal_container__c objUC:mapLstAccId.get(keyId))
                {                   
                    //system.debug('Check'+duplicateCheck);
                    if(objUC.Active__c == true){
                         objUC.Active__c=False;                       
                    }
                    /*if(objUC.BillingAddress_del__c == true){
                         objUC.BillingAddress_del__c=False;                      
                    }
                    if(objUC.ShippingAddress_del__c == true){
                         objUC.ShippingAddress_del__c=False;                    
                    }*/
                    lstToUpdate.add(objUC);
                }
                
            }
            if(!lstToUpdate.isEmpty())
            {
                system.debug(lstToUpdate);
                update lstToUpdate;
            }
        }
    }
}
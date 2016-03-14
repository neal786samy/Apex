trigger DeliveryInstallationStatus on Opportunity (before update) {
for(Opportunity opp : trigger.new)
    {

        Opportunity oldOpp = trigger.oldMap.get(opp.ID);   

        Opportunity newOpp = trigger.newMap.get(opp.ID);

        string oldDeliveryInstallationStatus = oldOpp.DeliveryInstallationStatus__c  ;

        string newDeliveryInstallationStatus = newOpp.DeliveryInstallationStatus__c  ;

        if(oldDeliveryInstallationStatus != newDeliveryInstallationStatus)
        {

            newOpp.DeliveryInstallationStatus__c='Completed';    
        }
                    
    }
}
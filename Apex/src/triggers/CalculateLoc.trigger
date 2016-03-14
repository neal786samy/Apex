trigger CalculateLoc on Account (before update) {
    for (Account updatedAccount : trigger.new) 
    {
        updatedAccount.NumberofLocations__c = 1;
    }
}
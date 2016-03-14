public class DomainTriggerHandler 
{
    public void onBeforeInsert()
    {
    	Set<String> domainSet = new Set<String>();
    	
    	// Split & get the doamin
    	for(sObject conItr : Trigger.new){
    		if(String.isNotBlank(String.valueOf(conItr.get('email'))))
    		{
    		   String emailString = String.valueOf(conItr.get('email'));
    	       domainSet.add(emailString.subString(emailString.indexOf('@')+1,emailString.length()));
    		}
    	}
    	
    	Map<String,Id> domainAccIdMap = new Map<String,Id>();
    	//Query on Account to get associate account for the domain
    	for(Account accItr : [SELECT Id,
    	                             DomainName__c
    	                        FROM Account 
    	                       WHERE DomainName__c IN :domainSet]){
    	                        
            domainAccIdMap.put(accItr.DomainName__c,accItr.Id);
        }
        
        //Associating Contact with Account
        for(sObject conItr : Trigger.new){
            if(String.isNotBlank(String.valueOf(conItr.get('email'))))
            {  
               String emailString = String.valueOf(conItr.get('email'));
               String domainString = emailString.subString(emailString.indexOf('@')+1,emailString.length());
               
               if(domainAccIdMap.containsKey(domainString)){
                   conItr.put('AccountId',domainAccIdMap.get(domainString));
               }
               
            }
        }
    }   
}
public with sharing class DMLOperations 
{
   public void databaseMethod()
        {
        
            list<Lead> leadList = new list<Lead> {          new Lead(FirstName='Joe',LastName='Smith',Company='Eternus',Status='Open-Not Contacted'),
                                                            new Lead(FirstName='Kathy',LastName='Smith'),
                                                            new Lead(FirstName='Caroline',LastName='Roth'),
                                                            new Lead()};
             
             list<Log__c> errorLog = new list <Log__c> ();                                                
                                                          

            Database.SaveResult[] srList = Database.insert(leadList , false);
            
            for (Database.SaveResult sr : srList) 
            {
              if (sr.isSuccess())
              {
                    System.debug('Successfully inserted Lead. Lead ID: ' + sr.getId()); // Operation was successful, so get the ID of the record that was processed
              } 
               else
              {
        
                for(Database.Error err : sr.getErrors())   // Operation failed, so get all errors
                { 

                    System.debug('The following error has occurred.');
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Lead fields that Caused this error: ' + err.getFields());
                    
                    Log__c newL = new Log__c();
                    newL.Name = 'Error';
                    newL.Error__c = err.getMessage() ; 
                    
                    errorLog.add(newL);

                }

              }

           }
           
           insert(errorLog);
   }

   public void dmlDelete()
   {
       list<Account> listTOBeDeleted = new list<Account>([SELECT  Id, 
                                                                  Name 
                                                             FROM Account
                                                            Where Active__c='No' And CreatedDate = LAST_90_DAYS]);
       delete(listTOBeDeleted);
   }
        
        
   public void upsertCheck()
   {
            
        
   }
}
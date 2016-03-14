trigger AccountDeletion on Account (before delete)
{
    for (Account accItr : [SELECT Id 
                        FROM Account 
                       WHERE Id IN (SELECT AccountId 
                                      FROM Opportunity) AND Id IN :trigger.old])
        {
            trigger.oldMap.get(accItr.Id).addError
            ('Cannot delete account with related opportunities_Created by Nikhil');
        }
}
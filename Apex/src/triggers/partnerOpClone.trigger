trigger partnerOpClone on Opportunity (before update) 
{
    Opportunity opp = [SELECT Id, 
                              closedate, 
                              Account.Name,
                              Account.Id 
                         FROM Opportunity 
                        WHERE StageName = 'Proposal/Price Quote'  limit 1];
    Opportunity newOpp = opp.clone(false, true);
    newOpp.StageName='Qualification';
    newOpp.amount=2000;
    String oppname = opp.account.Name; 
    newopp.Name = oppname;
    newOpp.closedate=opp.closedate;
    newOpp.account.id=opp.account.id;
    insert newOpp;
}
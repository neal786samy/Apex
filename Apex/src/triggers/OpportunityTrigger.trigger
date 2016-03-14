trigger OpportunityTrigger on Opportunity (after insert) 
{
    
    list<opportunity> Clone = new list<opportunity>(trigger.new);
    opportunity newclone = new opportunity();
    
    for( opportunity temp : Clone)
    {
        if(checkRecursion.runOnce())
        {
            newClone = temp.clone(false,false,true,true);
            insert(newClone);
        }
    }
    
}
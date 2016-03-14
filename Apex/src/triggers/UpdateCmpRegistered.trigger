trigger UpdateCmpRegistered on CampaignMember (before insert) 
{
    List<CampaignMember> campaignMemberList =new List<CampaignMember>();
    for(CampaignMember cmItr : Trigger.new)
    {
        if (cmItr.RSVPYes__c == NULL ) 
        {
             cmItr.RSVPYes__c=cmItr.Lead.RSVP_Yes__c;
        }
     }
   // update(c);
}
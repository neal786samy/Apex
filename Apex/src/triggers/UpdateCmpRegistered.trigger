trigger UpdateCmpRegistered on CampaignMember (after insert, after update) 
{
    Map<Id,CampaignMember> LeadCMMap = new Map<Id,CampaignMember>();
    for(CampaignMember cm : Trigger.new)
  {
      if(cm.RSVPYes__c == NULL && cm.leadId!=NULL)
      {
          LeadCMMap.put(cm.leadID,cm);
      }
  }
   Set<Id>  leadsInCampaignMember = LeadCMMap.keyset();
   list<lead> leadList=new list<lead>([SELECT id,RSVP_Yes__c from lead where id IN :leadsInCampaignMember]);
   list<CampaignMember> CampaignMemberList=new list<CampaignMember>([SELECT id,RSVPYes__c from CampaignMember]);
   for(Lead leItr: leadList)
   {
       //leItr.add(new CampaignMember(Id=))
       CampaignMember cm= new CampaignMember();
       cm.RSVPYes__c = leItr.RSVP_Yes__c;
       leadList.add(leItr);
   }
   update(leadList);
}
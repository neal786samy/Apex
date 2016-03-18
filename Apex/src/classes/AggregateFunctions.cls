public class AggregateFunctions 
{
	public void aggregateOpportunity()
    {
        List<AggregateResult> listamountReference = new List<AggregateResult>([SELECT sum(amount) sumAmount,
                                                                                      fiscalYear fiscalYear,
                                                                                      StageName stage 
                                                                                 FROM Opportunity 
                                                                                WHERE closeDate = THIS_FISCAL_YEAR and StageName = 'Closed Won'GROUP BY fiscalYear,StageName ]);
                                                                                 
           Map<Integer, Integer> newMap = new Map<Integer, Integer>();
           for(AggregateResult aggregateResult: listamountReference)
           {
               newMap.put(Integer.ValueOf(aggregateResult.get('fiscalYear')), Integer.ValueOf(aggregateResult.get('sumAmount')));
               
           }
           system.debug('Result is ---- > '+newMap);
    }
    
    public void AFTwo()
    {
        list<AggregateResult> leadList = new List<AggregateResult>([SELECT count(id) FROM lead GROUP BY leadsource HAVING COUNT(leadsource)>10]);
        system.debug(leadlist);
    }
    
    public void AFThree()
    {
        List<AggregateResult> arLeadByStatusBySource = [SELECT status,leadsource,count(name) FROM Lead GROUP BY status,leadsource];

		List<AggregateResult> arLeadByStatus = [SELECT status FROM Lead GROUP BY status];

		Map<String,Map<String,Integer>> mapLeadByStatusBySource = new Map<String,Map<String,Integer>>{};
		for(AggregateResult eachArrSt:arLeadByStatus) 
		{
        	Map<String,Integer> innerMap = new Map<String,Integer>{};
    		for(AggregateResult eachAggRes : arLeadByStatusBySource)
    		{
        	   if(((String)eachArrSt.get('Status'))==((String)eachAggRes.get('Status'))){
        	   innerMap.put((String)eachAggRes.get('LeadSource'),(Integer)eachAggRes.get('expr0'));
        	}
    	}
 		    mapLeadByStatusBySource.put((String)eachArrSt.get('Status'),innerMap);
	}
	    system.debug(mapLeadByStatusBySource);   
    }
}
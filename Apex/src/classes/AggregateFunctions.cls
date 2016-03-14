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
    
    public void aggregateLead()
    {
        list<AggregateResult> leadList = new List<AggregateResult>([SELECT count(id) 
                                                                      FROM lead GROUP BY leadsource HAVING COUNT(leadsource)>10]);
        system.debug('leadlist===='+leadlist);
    }
    
    public void aggregateLeadSource()
    {
        list<AggregateResult> leadList = new List<AggregateResult>([SELECT count(name),
                                                                           leadsource , 
                                                                           status 
                                                                      FROM lead group by leadsource , status]);
        map<object,object> inside = new map<object,object>();
        map<object,map<object,object>> outside = new map<object,map<object,object>>();
        
        for(AggregateResult resItr : leadList)
        {
            inside.put(resItr.get('Leadsource'),a.get('expr0'));
            outside.put(resItr.get('Status'),inside);
       
        }
}
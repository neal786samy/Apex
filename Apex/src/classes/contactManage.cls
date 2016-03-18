global with sharing class contactManage
{

    public contactManage(ApexPages.StandardSetController controller) {
        searchName=ApexPages.currentPage().getParameters().get('Name');
    }
    ApexPages.StandardController sc;
    private List<Account> lstAccount=new List<Account>();
    public Integer countAccount;
    Public String size1 { get; set; }
    Public String size2 { get; set; }
    public String searchName {get;set;}
    public List<Account> searchList {get;set;}
    public List<Contact> contactids {get;set;}
    public List<List<sObject>> keywordResults {get;set;}
    
    public List<Account> getLstAccount()
    {
        return [select Id,Name,Email__c,Phone,Website from Account];
    }
    
    public Integer getCountAccount(){
        return getLstAccount().size();
    }
    
    public void find()
    {    
        system.debug(searchName.length());
        if(searchName.length()< 3)
        {           
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Input at least 3 characters to perform search'));           
            //system.debug('error');         
        }
        else
        {
            String queryString='Select Id, Name,Phone,website,Email__c from Account where Name like \'%'+searchName+'%\' Order By Name';
            searchList=database.query(queryString);
        }
    }
    
    public void search(){
        
        List<List<sObject>> keywordResults = [FIND 'searchName' IN ALL FIELDS
                                      RETURNING Account (Id),Account(Name)];
    }
    public void clear()
    {
        String queryString= '';
           if(searchList != null)
           {
              searchList.clear();
           }
    }
    @RemoteAction
    global static void getContact(Id contactsid) {
    List<Contact> contactids = [SELECT Id, Name FROM Contact where Id=:contactsid];
    delete contactids;   
    //contactids.clear();
  
    }
}
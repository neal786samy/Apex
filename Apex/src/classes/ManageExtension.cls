global class ManageExtension{

    public String getAccount() {
        system.debug('extension'+currentId);
        list<Account> listAccount=[SELECT id, Name FROM Account WHERE Id=:currentID];
        String name=listAccount.get(0).name;
        return name;
    }


    public ManageExtension() {
          currentId=ApexPages.currentPage().getParameters().get('id');
            flag=false;
            listSearchAlphabet=new List<string>{'A','B','C','D','E','F','G','H',
                                          'I','J','K','L','M','N','O','P',
                                          'Q','R','S','T','U','V','W','X',
                                          'Y','Z','All'};
            alphabeticalSearch();
    }



    

    ApexPages.StandardController sc;
    public List<String> listSearchAlphabet{get;set;}
    private List<Account> lstAccount=new List<Account>();
    public List<Account> listSearchAccount {get;set;}
    public List<Contact> listSearchAlphabeticContact {get;set;}
    public String currentName {get;set;}
    public String currentId {get;set;}
    public Boolean flag{get;set;}
    public String SearchVar{get;set;}
    public static Contact contact { get; set; }
  
   public ManageExtension(ApexPages.StandardController sc){
            currentId=ApexPages.currentPage().getParameters().get('id');
           SearchVar=ApexPages.currentPage().getParameters().get('var');
            flag=false;
            listSearchAlphabet=new List<string>{'A','B','C','D','E','F','G','H',
                                          'I','J','K','L','M','N','O','P',
                                          'Q','R','S','T','U','V','W','X',
                                          'Y','Z','All'};
            alphabeticalSearch();
                                          
    }
    public List<Account> getLstAccount(){
        return [select Id,Name,Email__c,Phone,Website from Account];
    }
    public List<Contact> getLstContact(){
    system.debug('agsdb'+SearchVar);
        return [select Id,name from Contact where accountid=:currentId];
        
    }
    public Integer getCountContact(){
        return getLstContact().size();
    }
    public Integer getCountAccount(){
        return getLstAccount().size();
    }
    public void SearchAccount()
       {
            if(currentName .length()< 3)
           {           
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Input at least 3 characters to perform search'));           
            //system.debug('error');         
           }
        else
           {
                 String queryString='Select Id, Name,Phone,website,Email__c from Account where Name like \'%'+currentName +'%\' Order By Name';
                 listSearchAccount=database.query(queryString);
                 flag=true;
           }
       }
       public void clearAccount(){
         
          flag=false;
       }
   public void alphabeticalSearch(){
      
       system.debug('rahim'+searchVar);
       
       
       String queryStringIfSearchNull='SELECT Id, Name,Title,Email,Phone FROM Contact WHERE accountId=:currentId ORDER BY NAME';
       if(searchVar==null || searchVar=='All' ){
       listSearchAlphabeticContact =database.query(queryStringIfSearchNull);
       }
       else
       {
       searchVar=searchVar+'%';
       String queryStringIfSearchVarNotNull='SELECT Id, Name,Title,Email,Phone FROM Contact WHERE Name like:searchVar and accountid=:currentId ORDER BY NAME';
       listSearchAlphabeticContact =database.query(queryStringIfSearchVarNotNull);
       }
       system.debug(listSearchAlphabeticContact );
       
   
   }
   
   @RemoteAction
        global static void delContact(Id contactId) {
            system.debug('del ID form remote action method'+contactId);
            contact= [SELECT Id, Name
                       FROM Contact WHERE Id = :contactId];
           delete contact;
                    }
     /*@RemoteAction
    global static void getContact(Id contactsid) 
    {
        List<Contact> contactids = [SELECT Id, Name FROM Contact where Id=:contactsid];
        delete contactids;
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Contact has been deleted'));
        
    //contactids.clear();
    }*/
   
   
    }
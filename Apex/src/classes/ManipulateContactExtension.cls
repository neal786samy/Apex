global class ManipulateContactExtension{
//public boolean flag{get;set;}
private List<Account> lstAccount=new List<Account>();
    public List<Contact> lstContact=new List<Contact>();
    public List<Contact> displayContactList {get;set;}
    public String currentId {get;set;}
    //public string asgn{get;set;}
    public String alphabetVar {get;set;}
    public List<String> alphabetList {get;set;}  
    Public string conName{get; set;}  
    public contact cdel = new contact();
    public ManipulateContactExtension(ApexPages.StandardController sc){ 
        currentId=ApexPages.currentPage().getParameters().get('id');
        alphabetVar =ApexPages.currentPage().getParameters().get('VarAlpha');
        //flag=ApexPages.currentPage().getParameters().get(false);
        alphabetList=new List<String>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','All'};
        alphabetVar='B'; 
        //flag=false;
        displayContactList=new List<Contact>([select Id,Name,Phone,Email from Contact where AccountId=:currentId ORDER BY Name ]); 
        lstContact=new List<Contact>();
        system.debug('1'+ displayContactList);
        for(Contact objContact: displayContactList){
        system.debug(displayContactList);
            if(alphabetVar.equals('All')){
                lstContact.add(objContact);
            }
            else{
                    if((objContact.Name.startsWith(alphabetVar)) || (objContact.Name.startsWith(alphabetVar.toLowerCase()))){
                    lstContact.add(objContact);
                }
            }
        }  
    }
    public ManipulateContactExtension(TableExampleController controller) {
        //flag=false;
    }
 
    public ManipulateContactExtension() {
       // flag=false;
    }
    
    public void displayAlphabeticalSearch(){
   
        lstContact.clear();
        system.debug(alphabetVar);
        
        for(Contact objContact: displayContactList){
            if(alphabetVar.equals('All')){
                lstContact.add(objContact);
            }
            else{
                if((objContact.Name.startsWith(alphabetVar)) || (objContact.Name.startsWith(alphabetVar.toLowerCase()))){
                    lstContact.add(objContact);
                }
            }
        }  
        system.debug(lstContact);
        //flag=true;
    }
    public List<Account> getLstAccount(){
     system.debug('i');
        return [select Id,Name from Account where Id=:currentId ];
       
    }
    
    public List<Contact> getLstContact(){
    //flag=true;
        conName = conName + '%';
        return [select Id,Name,Phone,Email from Contact where AccountId =: currentId AND name LIKE: conName]; 
           
         
    }
    public pagereference deleteCon() {
        lstContact=[select Id,Name,Phone,Email from Contact where AccountId=:currentId ];
        delete lstContact;
        pagereference ref = new pagereference('/apex/AccountManagerVF');
        ref.setredirect(True);
        return ref;   
    }
    @RemoteAction
    global static void getContact(Id contactsid) 
    {
        List<Contact> contactids = [SELECT Id, Name FROM Contact where Id=:contactsid];
        delete contactids;   
    //contactids.clear();
    }
}
Public Class VisualForceComponentController{

    public String currentId {get;set;}
    public List<Account> lstAccount=new List<Account>();
    public List<Contact> lstContactCon=new List<Contact>();
    Public VisualForceComponentController(){
    
    currentId=ApexPages.currentPage().getParameters().get('id');
    }
    public List<Account> getLstAccount(){
        return [select Id,Name,Email__c,Phone,Website from Account];
    }
     public Integer getCountAccount(){
        return getLstAccount().size();
    }
    public List<Contact> getLstContactCon(){
        return [select Id from Contact where AccountId=:currentId ]; 
    }
     public Integer getCountContactCon(){
        return getLstContactCon().size();
    }
}
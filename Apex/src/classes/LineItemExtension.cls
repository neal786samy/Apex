public class LineItemExtension
{
   
    public List<Line_item__c> Listlabor = new List<Line_item__c>();
    public String currentId {get;set;}
   
    
    ApexPages.StandardController sc1;     
    public LineItemExtension(ApexPages.StandardController controller)
    {
        currentId=ApexPages.currentPage().getParameters().get('id');
    }
    
     
    public List<Line_item__c> getListLabor()
    {
        list<Line_item__c> lstlabour = [select Service_Fee__c,tax__c,New_client_Discount__c,labor__c,total__c from Line_item__c where LineInvoiceMD__c =: currentId];
        system.debug(lstlabour);
        return lstlabour ;
        
    }
    
    /* public List<Invoice_Statement__c> getListContact()
    {
        
        list<Invoice_Statement__c> lstInv = [Select  i.id,i.InvoiceConLookup__r.Phone,i.InvoiceConLookup__r.MailingCity,i.InvoiceConLookup__r.MailingAddress,i.InvoiceConLookup__r.FirstName,i.InvoiceConLookup__r.Email,i.InvoiceConLookup__r.MailingPostalCode,i.InvoiceAccLookup__c, i.Company__c From Invoice_Statement__c i where i.InvoiceConLookup__c =: currentId];
        system.debug(lstInv);
        return lstInv ;
        
    } */
    
}
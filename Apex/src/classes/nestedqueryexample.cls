public class nestedqueryexample
{
  public List<Account> getaccsandtmember()
  {
      List<Account> accounts = [select id,(select id, FirstName, LastName from Contacts), Name, BillingCountry from Account];
      return accounts;
  }
}
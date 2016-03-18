@isTest

public class TestDataFactory {

    public static List<Account> createAccountsWithCons(Integer numAccts, Integer numConsPerAcct) {

        List<Account> accts = new List<Account>();

         

        for(Integer i=0;i<numAccts;i++) {

            Account a = new Account(Name='TestAccount' + i);

            accts.add(a);

        }

        insert accts;

         

        List<Contact> cons = new List<Contact>();

        for (Integer j=0;j<numAccts;j++) {

            Account acct = accts[j];

            // For each account just inserted, add opportunities

            for (Integer k=0;k<numConsPerAcct;k++) {

                cons.add(new Contact(

                                       LastName='Pote',

                                       Phone='8087601348',

                                       AccountId=acct.Id));

            }

        }

        // Insert all opportunities for all accounts.

        insert cons;

         

        return accts;
    }
}
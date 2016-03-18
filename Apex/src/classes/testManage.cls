@isTest
    private class testManage {
        static testmethod void test1() {
            utilityTestManage.createTestRecords(5,3);
            Account objAccount = [SELECT Id,Name FROM Account WHERE Name='TestAccount0'];
            Contact objContact = [SELECT Id,Name FROM Contact WHERE AccountId=:objAccount.Id LIMIT 1];
            
            list<Account> listAccount=[SELECT Id,Name FROM Account ];
            list<Contact> listContact=[SELECT Id,Name FROM Contact ];
            ApexPages.StandardController sc;
            Test.setCurrentPageReference(new PageReference('Page.myPage'));
            System.currentPageReference().getParameters().put('idAccount', objAccount.Id);
            System.currentPageReference().getParameters().put('idContact', objContact.Id);
            System.currentPageReference().getParameters().put('var', 'A');
            System.currentPageReference().getParameters().put('VarAlpha', 'text');
            //System.currentPageReference().getParameters().put('false', 'True');
            ManipulateContactExtension objManageExtension = new ManipulateContactExtension(sc);
            ManipulateContactExtension objManageExtension1 = new ManipulateContactExtension();
            System.currentPageReference().getParameters().put('VarAlpha', 'A');
            
          
            // Run some tests
            
             
            objManageExtension.getLstContact();
            objManageExtension.getLstAccount();
            objManageExtension.deleteCon();
            objManageExtension.displayAlphabeticalSearch();
           
            //objManageExtension.getCountAccount();
            //objManageExtension.getCountContact();
            //objManageExtension.SearchAccount();
            //objManageExtension.clearAccount();
        
            
            
            ManipulateContactExtension.getContact(objContact.Id);
            
            
            System.assertEquals(listAccount.size(),5);
            System.assertEquals(listContact.size(),15);
            
           
        }
    }
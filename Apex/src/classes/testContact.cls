@isTest
    private class testContact {
        static testmethod void test1() {
            utilityTestManage.createTestRecords(5,3);
            Account objAccount = [SELECT Id,Name FROM Account WHERE Name='TestAccount0'];
            Contact objContact = [SELECT Id,Name FROM Contact WHERE AccountId=:objAccount.Id LIMIT 1];
            list<Account> listAccount=[SELECT Id,Name FROM Account ];
            list<Contact> listContact=[SELECT Id,Name FROM Contact ];
            ApexPages.StandardSetController sc;          
            Test.setCurrentPageReference(new PageReference('Page.ContactRef'));
            System.currentPageReference().getParameters().put('idAccount', objAccount.Id);
            System.currentPageReference().getParameters().put('idContact', objContact.Id);
            System.currentPageReference().getParameters().put('var', 'A');
            System.currentPageReference().getParameters().put('Name', 'Nikhil');
            contactManage objManageExtension = new contactManage(sc);
            //contactManage objManageExtension1 = new contactManage();
           
           
            
          
            // Run some tests
            
             
            //objManageExtension.getLstContact();
            objManageExtension.getLstAccount();
            //objManageExtension.deleteCon(objContact.Id);
            //objManageExtension.displayAlphabeticalSearch();
            objManageExtension.getCountAccount();
            //objManageExtension.getCountContact();
            objManageExtension.find();
            objManageExtension.search();
            objManageExtension.clear();
        
            
            contactManage.getContact(objContact.Id);
            //ManageExtension.delContact(objContact.Id);
            
            
            System.assertEquals(listAccount.size(),5);
            System.assertEquals(listContact.size(),15);
            
           
        }
    }
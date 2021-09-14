@isTest
public class AddPrimaryContactTest {
    
    @testSetup static void setupMethod(){
        List<Account> accounts = new List<Account>();
        for(Integer i=0;i<50;i++){
            accounts.add(new Account(Name='testAcc1'+i,BillingState='NY'));
			accounts.add(new Account(Name='testAccount'+i,BillingState='CA'));                
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        for(Account a : accounts){
            contacts.add(new Contact(lastName='testCon',AccountId=a.id));
        }
        insert contacts;
    }
    
    @isTest static void testContact(){
        test.startTest();
        system.enqueueJob(new AddPrimaryContact(new Contact(lastName='testCon'),'CA'));
        test.stopTest();
    }
    
}
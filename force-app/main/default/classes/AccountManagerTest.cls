@isTest
public class AccountManagerTest {
    
    @isTest static void testGetAccount(){
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri ='https://myInstance.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account accountFetched = AccountManager.getAccount();
        // Verify results
        System.assert(accountFetched != null);
        //Verifying account name (Adding comment for test on FeatureBranch1) 
        System.assertEquals('Test Account', accountFetched.Name);
    }
    
    @isTest static void testGetAccountNull(){
        Id recordId = createTestRecord2();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri ='https://myInstance.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account accountFetched = AccountManager.getAccount();
        // Verify results
        System.assert(accountFetched == null);
    }
    
    //Helper Method
    static Id createTestRecord(){
        // Create test record
        Account accTest = new Account(Name='Test Account');
        insert accTest;
        
        Contact conTest = new Contact(AccountId=accTest.id,lastName='testCon');
        insert conTest;
        
        return accTest.Id;
    }
    
    //Helper Method2
    static Id createTestRecord2(){
        // Create test record
        Account accTest = new Account(Name='Test Account');
        insert accTest;
        
        Contact conTest = new Contact(AccountId=accTest.id,lastName='testCon');
        insert conTest;
        
        return conTest.Id;
    }

}
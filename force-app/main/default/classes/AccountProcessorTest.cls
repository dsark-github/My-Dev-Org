@isTest
public class AccountProcessorTest {
    @isTest static void testNoOfContacts(){
        Map<Id,Account> idVsAccountMap = TestDataFactory.createAccountsWithContacts(2,3);
        test.startTest();
        AccountProcessor.countContacts(New List<Id>(idVsAccountMap.keySet()));
        test.stopTest();
    }
}
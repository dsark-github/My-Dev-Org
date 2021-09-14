@isTest
public class LeadProcessorTest {
	@testSetup
    static void setupMethod(){
        List<Lead> leads = new List<Lead>();
        for(integer i=0;i<200;i++){
            leads.add(New Lead(LastName='lname'+i,Company='Test Company '+i));
        }
        insert leads;
    }
    @isTest static void testLeads(){
        test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Database.executeBatch(lp);
        test.stopTest();
    }
}
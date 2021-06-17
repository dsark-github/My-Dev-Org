@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ?';
    @testSetup static void setupMethod(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i<200;i++){
        	leads.add(new Lead(LastName='testLName'+i,Company='Company'+i));    
        }
        insert leads;
    }
    
    @isTest static void testLeads(){
        test.startTest();
        system.schedule('Blank Lead Processor',CRON_EXP,new DailyLeadProcessor());
        test.stopTest();
    }
}
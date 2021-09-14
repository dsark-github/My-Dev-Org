@isTest
private class TestVerifyDate {

    @isTest static void testDateIn30Days(){
    	Date startDate = Date.today();
        Date endDate = startDate.addDays(15);
        VerifyDate.CheckDates(startDate,endDate);
	}
    
    @isTest static void testDateNotIn30Days(){
    	Date startDate = Date.today();
        Date endDate = startDate.addDays(32);
        VerifyDate.CheckDates(startDate,endDate);
	}
    
    @isTest static void testDateNegativeRange(){
    	Date startDate = Date.today();
        Date endDate = startDate.addDays(-2);
        VerifyDate.CheckDates(startDate,endDate);
	}
}
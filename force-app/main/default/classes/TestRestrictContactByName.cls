@isTest
private class TestRestrictContactByName {
    @isTest static void testInvalidLastName(){
        Contact con = new Contact();
		con.lastName = 'INVALIDNAME';
        test.startTest();
        Database.SaveResult result = Database.insert(con,false);
        test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+con.lastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());
    }
}
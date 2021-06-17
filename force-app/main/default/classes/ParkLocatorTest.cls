@isTest
public class ParkLocatorTest {
    @isTest static void locateByCountry(){
        
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        String[] resultfromCallOut = ParkLocator.country('India');
        String[] parkNames = new String[]{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
        System.assertEquals(parkNames, resultfromCallOut);
    }
}
@isTest
public class AnimalLocatorTest {
    
    @isTest static void testAnimalLoc(){
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        //calling class method
        String animalName = AnimalLocator.getAnimalNameById(1);
        system.assertEquals('chicken', animalName);
    }
    
    @isTest static void testAnimalLoc2(){
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMockNegative());
        //calling class method
        String animalName = AnimalLocator.getAnimalNameById(1);
        system.assertEquals(null, animalName);
    }
    
    public class AnimalLocatorMockNegative implements HttpCalloutMock {
        // Implement this interface method
        public HTTPResponse respond(HTTPRequest request) {
            // Create a fake response
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
            response.setStatusCode(500);
            return response; 
        }
    }
}
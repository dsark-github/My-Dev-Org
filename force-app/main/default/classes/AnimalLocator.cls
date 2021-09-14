public class AnimalLocator {
    
    public static String getAnimalNameById(Integer animalId){
        Http http = new Http();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            AnimalDetailsWrapper wrapper = AnimalDetailsWrapper.parse(response.getBody());
            return String.valueOf(wrapper.animal.name);
        }else{
            return null;
        }
    }

}
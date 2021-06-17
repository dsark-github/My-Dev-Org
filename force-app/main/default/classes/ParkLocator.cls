public class ParkLocator {
    
    public static String[] country(String countryName){
        
        ParkService.ParksImplPort parkSvc = new ParkService.ParksImplPort();
        String[] response = parkSvc.byCountry(countryName);
        
        return response;
    }
}
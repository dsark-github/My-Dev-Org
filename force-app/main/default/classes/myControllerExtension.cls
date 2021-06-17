public class myControllerExtension {
    
    private Account acc;
    public myControllerExtension(ApexPages.StandardController controller) {
        this.acc = (Account)controller.getRecord();
    }
    
    public String getWelcome()
    {
        return 'This is page of'+acc.name;
    }
}
public class AddPrimaryContact implements Queueable{
    
    private String stateAbbreviation;
    private Contact contact;
    
    public AddPrimaryContact(Contact con, String stateAbbr){
        this.stateAbbreviation = stateAbbr;
        this.contact = con;
    }
    public void execute(QueueableContext context){
        List<Contact> contactsToInsert = new List<Contact>();
        List<Account> accounts = [Select id,(Select id,lastName from Contacts) from Account where BillingState =: stateAbbreviation limit 200];
        for(Account a : accounts){
        	for(Contact con : a.contacts){
            	Contact cont = con.clone(false,false,false,false);
            	contactsToInsert.add(cont);
        	}
    	}
        if(contactsToInsert.size()>0){
            insert contactsToInsert;
        }
    } 
}
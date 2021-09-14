public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String lastNameStr){
        List<Contact> contactsToReturn = new List<Contact>(); 
        for(Integer i=0;i<numOfContacts;i++){
            Contact con = new Contact();
            con.LastName = lastNameStr+' '+i;
            con.FirstName = 'Test '+i;
            contactsToReturn.add(con);
        }
        return contactsToReturn;
    }
}
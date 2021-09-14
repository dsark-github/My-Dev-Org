public class AccountProcessor {
	@future
    public static void countContacts(List<Id> accIds){
        
        Map<Id,List<Contact>> accIdVsContactMap = new Map<Id,List<Contact>>();
        for(Contact con : [Select id,AccountId from Contact where accountId in : accIds]){
            if(accIdVsContactMap.containsKey(con.AccountId)){
            	accIdVsContactMap.get(con.AccountId).add(con);
            }else{
                accIdVsContactMap.put(con.AccountId, new List<Contact>{con});
            }
        }

        List<Account> accountsToUpdate = new List<Account>();
        for(Account a : [Select id,Number_of_Contacts__c from Account where Id in : accIds]){
            a.Number_of_Contacts__c = accIdVsContactMap.get(a.id).size();
            accountsToUpdate.add(a);
        }
        update accountsToUpdate;
    }
}
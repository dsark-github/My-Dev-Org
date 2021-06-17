//Adding Test Comment
@RestResource(urlMapping='/Accounts/')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        // grab the accountId from the end of the URL
        Id accountId = request.requestURI.substring(request.requestURI.lastIndexOf('Accounts/')+9, request.requestURI.lastIndexOf('/contacts'));
        
        List<Account> accList = [Select id,name,(Select id,name from Contacts) from Account where id=:accountId limit 1];
        if(accList.size() > 0)
            return accList[0];
        else
            return null;    
        
    }
}

public class ContactExtension {
        
    //public List<Deal_Action__c> dealAction {get;set;}
    public Deal__c deal;
    public Deal_Action__c dealAc;
    public Contact cont;
    
    
    
    public ContactExtension(ApexPages.StandardController controller) {
             
        this.cont = (Contact)controller.getRecord(); 
        
        // dealAction = [SELECT id, Name, Action__c, Deal__c, Contact__c, Disable_Status__c, Deal__r.Valid_Through__c, 
        //                   Deal__r.Available_Deals__c, Deal__r.Attachment__c FROM Deal_Action__c];         
        
    }
    
    
    public List<Deal_Action__c> getdealAction(){
        
        List<Deal_Action__c> lstDealActions = new List<Deal_Action__c>();
        lstDealActions = [SELECT id, Name, Action__c, Deal__c, Contact__c, Disable_Status__c, Deal__r.Valid_Through__c, 
                           Deal__r.Available_Deals__c, Deal__r.Attachment__c FROM Deal_Action__c];
        return lstDealActions;                           
    } 
    
    public Contact getContact(){
        return [select Name, Acceptance_Rate__c, Deals_Accepted__c, Deals_Rejected__c FROM Contact Where id=: cont.id];
    }
    
    public PageReference navigateToContactDetail(){
        
        PageReference pr = new PageReference('/'+cont.id);
        pr.setRedirect(true);
        return pr;
        
    }
    
    
    public String acceptMethod(){
        
        String dealAId = ApexPages.CurrentPage().getParameters().get('dAId');
        
        dealAc = [SELECT Name, Action__c, Deal__c  FROM Deal_Action__c 
                     WHERE ID = : dealAId];
        dealAc.Action__c = 'Accepted';
        dealAc.Contact__c = cont.id;
        update dealAc;
        
        Deal_Action__c newDA = new Deal_Action__c(Deal__c = dealAc.Deal__c, Action__c = 'Available'); 
        insert newDA;
        
        system.debug('debugme....dealname from deal_action ---- '+dealAc.Deal__c);
        
        deal = [SELECT Name,Acceptances__c  FROM Deal__c 
                     WHERE id = : dealAc.Deal__c];
        
        system.debug('debugme....dealname---- '+deal.name);             
                     
        deal.Acceptances__c += 1;              
        update deal;             
         
                  
        cont.Deals_Accepted__c += 1; 
        update cont; 
                   
        
        return null;
    }
    
    public String rejectMethod(){
        
        String dealAId = ApexPages.CurrentPage().getParameters().get('dAId');
        
        dealAc = [SELECT Name, Action__c, Deal__c  FROM Deal_Action__c 
                     WHERE ID = : dealAId];
        dealAc.Action__c = 'Rejected';
        dealAc.Contact__c = cont.id;
        update dealAc;
        
        Deal_Action__c newDA = new Deal_Action__c(Deal__c = dealAc.Deal__c, Action__c = 'Available'); 
        insert newDA;
        
        deal = [SELECT Name,Rejections__c  FROM Deal__c 
                     WHERE id = : dealAc.Deal__c];                
        deal.Rejections__c += 1;              
        update deal;             
         
                  
        cont.Deals_Rejected__c += 1; 
        update cont; 
                
        
        return null;
    }
    
    

}
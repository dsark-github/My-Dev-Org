trigger CreateDealAction on Deal__c (after insert) {
    
    List<Deal_Action__c> lstDealActions = new List<Deal_Action__c>();
    
    for(Deal__c deal: Trigger.new){
        
        Deal_Action__c dealAction = new Deal_Action__c(Action__c= 'Available', Deal__c= deal.id);
        
        lstDealActions.add(dealAction); 
    } 
    
    insert lstDealActions;
}
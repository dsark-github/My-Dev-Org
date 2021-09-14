global class LeadProcessor implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'Select id,LeadSource from Lead';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> leads){
        List<Lead> leadsToUpdate = new List<Lead>();
        if(leads.size()>0){
            for(Lead l:leads){
             	l.LeadSource = 'Dreamforce';
                leadsToUpdate.add(l);
            }
          	update leadsToUpdate;
        }
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
    
}
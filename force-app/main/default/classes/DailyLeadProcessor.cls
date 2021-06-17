global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext context){
        List<Lead> leads = [Select id,LeadSource from Lead where LeadSource =:'' OR LeadSource =: null limit 200];
        for(Lead l : leads){
            l.LeadSource = 'Dreamforce';
        }
        if(leads.size()>0){
        	update leads;     
        }
    }
}
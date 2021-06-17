trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> tasksToInsert = new List<Task>();
    
    // Iterate over Opportunities only with Stage "Closed Won"
    for(Opportunity o : [Select id from Opportunity where StageName=:'Closed Won']){
		Task tsk = new Task();
		tsk.Subject='Follow Up Test Task';
        tasksToInsert.add(tsk);   
	}
	if(tasksToInsert.size() > 0){
    	insert tasksToInsert;
	}                         
}
trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {

    List<BatchLeadConvertErrors__c > batchLeadConvertErrors = new List<BatchLeadConvertErrors__c >();
       
    // Iterate through each notification.
    for (BatchApexErrorEvent event : Trigger.New) {
        BatchLeadConvertErrors__c batchLeadConvertError = new BatchLeadConvertErrors__c();
        batchLeadConvertError.AsyncApexJobId__c = event.AsyncApexJobId;
        batchLeadConvertError.Records__c = event.JobScope;
        batchLeadConvertError.StackTrace__c = event.StackTrace;
        batchLeadConvertErrors.add(batchLeadConvertError);
    }
   	
    
	//Insert all BatchLeadConvertErrors corresponding to events received.
    if(batchLeadConvertErrors.size() > 0) {
        insert batchLeadConvertErrors;
    }

}
// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class Employee__c {
    global List<ActivityHistory> ActivityHistories;
    global String Address__c;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<Attachment> Attachments;
    global Double Balance_Leaves__c;
    global List<CombinedAttachment> CombinedAttachments;
    global String Contact__c;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global String Country__c;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime CreatedDate;
    global Date Date_of_Joining__c;
    global List<DuplicateRecordItem> DuplicateRecordItems;
    global String Ecode__c;
    global String Email__c;
    global List<EmailMessage> Emails;
    global List<Event> Events;
    global String FNAME__c;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<ContentVersion> FirstPublishLocation;
    global String First_Name__c;
    global String Full_Name__c;
    global Id Id;
    global Boolean IsDeleted;
    global Date LastActivityDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime LastModifiedDate;
    global Datetime LastReferencedDate;
    global Datetime LastViewedDate;
    global String Last_Name__c;
    global List<Leave_Applications__c> Leave_Applications__r;
    global String Name;
    global List<Note> Notes;
    global List<NoteAndAttachment> NotesAndAttachments;
    global List<OpenActivity> OpenActivities;
    global SObject Owner;
    global Id OwnerId;
    global List<FeedComment> Parent;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordActionHistory> RecordActionHistories;
    global List<RecordAction> RecordActions;
    global List<CollaborationGroupRecord> RecordAssociatedGroups;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<EventRelationChangeEvent> Relation;
    global String Social_Page__c;
    global String States__c;
    global Datetime SystemModstamp;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global Double Total_Leaves_Availed__c;
    global Double Total_Leaves__c;
    global Id User__c;
    global User User__r;
    global List<EventChangeEvent> What;

    global Employee__c () 
    {
    }
}
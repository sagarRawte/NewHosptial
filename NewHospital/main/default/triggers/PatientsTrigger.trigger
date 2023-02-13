trigger PatientsTrigger on patient__c (after insert) {
  CreateRelatedFollow.createRelatedFollowUp(Trigger.new);
}
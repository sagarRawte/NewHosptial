trigger followOnNewPatient on patient__c (after insert) {
    public List<Followups__c>follow=new List<Followups__c>();
    for(patient__c pcc:Trigger.new){
        Followups__c f=new Followups__c(
            Patient_ID__c=pcc.Id,
            Patient_ID1__c=pcc.ID__c,
            Name=pcc.Name,
            Title__c=pcc.Title__c,
            MobileNo__c=pcc.MobileNo__c,
            Height__c=pcc.Height__c,
            Weight__c=pcc.Weight__c,
            Age__c=pcc.Age__c,
            landlineNo__c=pcc.landlineNo__c,
            Address__c=pcc.Address__c,
            Consultant_Id__c=pcc.Consultant__c,
            Sex__c=pcc.Sex__c,
            EmailId__c=pcc.EmailId__c,
            refbyId__c=pcc.ref_by__c);
        
           follow.add(f);
    }
    Insert follow;
    
}
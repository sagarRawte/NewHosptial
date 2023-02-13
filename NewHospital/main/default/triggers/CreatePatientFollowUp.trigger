trigger CreatePatientFollowUp on patient__c (After insert) {
    if(trigger.isInsert){
        List<Followups__c>ft=new List<Followups__c>();
        for(patient__c pcc:trigger.new){
            Followups__c f=new Followups__c(Name=pcc.Name,  
                                          
                                           Title__c=pcc.Title__c,
                                           Age__c=pcc.Age__c,
                                           EmailId__c=pcc.EmailId__c,
                                           MobileNo__c=pcc.MobileNo__c,
                                           Weight__c=pcc.Weight__c,
                                           Sex__c=pcc.Sex__c,
                                           Height__c=pcc.Height__c,
                                           landlineNo__c=pcc.landlineNo__c);
            ft.add(f);
            
        }
        insert ft;
    }

}
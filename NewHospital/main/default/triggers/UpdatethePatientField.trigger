trigger UpdatethePatientField on Followups__c ( after update) {
     
    if(trigger.isAfter){
        system.debug('Event after trigger');
        if(trigger.isUpdate){            
            Map<Id,Followups__c> fonMapItem=new Map<Id,Followups__c>();
            
            for(Followups__c fon:Trigger.new){
                fonMapItem.put(fon.Patient_ID__c,fon);        
            }
            List<patient__c> pccObjList=[select Id,Name,Height__c,(select Id,Patient_ID__c,Name,Height__c from Followups1__r) from patient__c where Id in:fonMapItem.keyset()];
            if(pccObjList.size()>0){
                for(patient__c a:pccObjList){
                    a.Height__c=fonMapItem.get(a.id).Height__c;            
                }
                update pccObjList;        
            }
        }
    }

}
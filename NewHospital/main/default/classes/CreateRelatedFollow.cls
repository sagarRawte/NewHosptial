public class CreateRelatedFollow{
    public static void createRelatedFollowUp(List<patient__c>pccList) {
     List<Followups__c>followList=new List<Followups__c>();
    for(patient__c pcc:pccList){
        Followups__c fon=new Followups__c();
        fon.Name=pcc.Name;
       
        fon.Age__c=pcc.Age__c;
        fon.Address__c=pcc.Address__c;
        fon.Name=pcc.Name;
        fon.Address__c=pcc.Address__c;
        fon.Consultant_Id__c=pcc.Consultant__c;
        fon.Sex__c=pcc.Sex__c;
        fon.EmailId__c=pcc.EmailId__c;
        fon.refbyId__c=pcc.ref_by__c;
        
        followList.add(fon);
    }
    if(!followList.isEmpty()){
        insert followList;
    }

  }
}
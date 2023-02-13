public class FollowUp {
    public static Date startDate{get;set;}
    public static Date endDate{get;set;}
    public static List<Followups__c>FollowUpList{get;set;}
    public boolean showResult{get;set;}
    public boolean noResultFound{get;set;}
    
    
    public FollowUp(){
        showResult=false;
        noResultFound=false;
        FollowUpList=new List<Followups__c>();
    }
    public PageReference searchfollowUp(){
        if(startDate!=NUll  ){
           FollowUpList=[select Id,Name, Sex__c,Followup_Date__c,Consultant_Id__c,Patient_ID1__c,MobileNo__c,created_date__c from Followups__c
                         where created_date__c>=: startDate ]; 
        }
        if(FollowUpList.size()>0){
            showResult=true;
            noResultFound=false;
        }
        else{
            noResultFound=true;
            showResult=false;
        }
        return null;
    }
}
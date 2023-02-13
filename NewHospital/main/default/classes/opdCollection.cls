public class opdCollection {
      public static Date startDate{get;set;}
    public static Date endDate{get;set;}
    public static List<opd_Collection__c>OpdCollectList{get;set;}
    public boolean showResult{get;set;}
    public boolean noResultFound{get;set;}
    
    
    public opdCollection(){
        showResult=false;
        noResultFound=false;
        OpdCollectList=new List<opd_Collection__c>();
    }
    public PageReference searchCollection(){
        if(startDate!=NUll  ){
           OpdCollectList=[select Id,patientId__c,opdCollectionData__c,Amount__c,ConsultantId__c from opd_Collection__c
                         where opdCollectionData__c>=: startDate ]; 
        }
        if(OpdCollectList.size()>0){
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
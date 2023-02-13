public class demopatientController {
     Public List<Followups__c> accList {get;set;}
    public Integer rowIndex {get;set;}
     string  textkey;
    
    public demopatientController(){
        accList = new list<Followups__c>();
        accList.add(new Followups__c());
    }
     
    public void addRow(){
        accList.add(new Followups__c());
    }
     
    public pagereference saveAccount(){
        Update accList;
        return null;
    }
     
    public PageReference deleteRow(){
        rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
        accList.remove(rowIndex);
        return null;
    }
    
    public String gettextkey(){
         return textkey;
    }
    public void settextkey(string s){
        textkey=s;
        
    }
    public List<Followups__c>getResult(){
        return accList;
    }
    public PageReference doSearch(){
        textkey=textkey+'%';
        if(textkey.length()>=2){
       string searchquery ='Select id, Followup_Date__c,Height__c,Weight__c,bloodUrea__c,HB__c,srCreatine__c,UrineProtein__c,UrinePC__c,UrinePH__c,Urine24HR__c,UrineRBC__c,serumChloesterol__c,serumAlbumin__c,Others1__c,Others2__c,Name,Sex__c,EmailId__c,MobileNo__c From Followups__c WHERE Name LIKE:textkey';
        
             accList=Database.query(searchquery) ; 
        }
            if(accList.isEmpty()){
            throw new AuraHandledException('NO Record found...');
        }
        return null;
    }

}
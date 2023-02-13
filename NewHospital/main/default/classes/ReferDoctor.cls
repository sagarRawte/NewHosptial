public class ReferDoctor {
    @AuraEnabled
    public static void insertDocters(String jsonOfListOfDoctors) {
        List<ref_by__c> listOfDoctors = (List<ref_by__c>) JSON.deserialize(jsonOfListOfDoctors,List<ref_by__c>.class);
        insert listOfDoctors;
    }

}
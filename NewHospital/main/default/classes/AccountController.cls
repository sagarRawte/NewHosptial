/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-02-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<patient__c>fetchPatients(String searchKey) 
    {
        String strKey ='%'+ searchKey +'%';
        
        return [SELECT ID__c, Name, Sex__c, newPatientDate__c, EmailId__c,MobileNo__c FROM patient__c  where Name Like: strKey limit 10 ];

    }
}
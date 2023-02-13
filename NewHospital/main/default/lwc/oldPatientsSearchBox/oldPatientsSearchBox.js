import { LightningElement,track,api} from 'lwc';
import fetchPatients from '@salesforce/apex/AccountController.fetchPatients';
 import { NavigationMixin } from 'lightning/navigation';


const COLUMNS = [  
    { label: 'Id', fieldName: 'ID__c' },  
    { label: 'Name', fieldName: 'Name' }, 
    { label: 'Sex', fieldName: 'Sex__c' },
    { label: 'newPatientDate', fieldName: 'newPatientDate__c' },  
     {label: 'MobileNo', fieldName: 'MobileNo__c' },
    { label: 'EmailId', fieldName: 'EmailId__c' },  
    { type: "button", typeAttributes: {  
        label: 'View',  
        name: 'View',  
        title: 'View',  
        disabled: false,  
        value: 'view',  
        iconPosition: 'left'  
    } },  
    { type: "button", typeAttributes: {  
        label: 'Edit',  
        name: 'Edit',  
        title: 'Edit',  
        disabled: false,  
        value: 'edit',  
        iconPosition: 'left'  
    } }
    
];  
export default class OldPatientsSearchBox extends NavigationMixin( LightningElement) {
    patients;  
    error;  
    columns = COLUMNS;  
  
    handleKeyChange( event ) {  
          
        const searchKey = event.target.value;  
  
        if ( searchKey ) {  
  
            fetchPatients( { searchKey } )    
            .then(result => {  
  
                this.patients = result;  
  
            })  
            .catch(error => {  
  
                this.error = error;  
  
            });  
  
        } else  
        this.patients = undefined;  
  
    }      
      
    callRowAction( event ) {  
          
        const recId =  event.detail.row.Id;  
        const actionName = event.detail.action.name;  
        if ( actionName === 'Edit' ) {  
  
            this[NavigationMixin.Navigate]({  
                type:'standard__recordPage',  
                attributes: {  
                    recordId: recId,  
                    objectApiName: 'patient__c',  
                    actionName: 'edit'  
                }  
            })  
  
        } else if ( actionName === 'View') {  
  
            this[NavigationMixin.Navigate]({  
                type: 'standard__recordPage',  
                attributes: {  
                    recordId: recId,  
                    objectApiName: 'patient__c',  
                    actionName: 'view'  
                }  
            })  
  
        }
       





  
    }  
}
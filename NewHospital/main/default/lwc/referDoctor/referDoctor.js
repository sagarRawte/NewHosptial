import { LightningElement,track} from 'lwc';
import insertDocters from '@salesforce/apex/ReferDoctor.insertDocters'; 
import {ShowToastEvent} from "lightning/platformShowToastEvent";
export default class ReferDoctor extends LightningElement {
    
    @track listOfDoctors;

    connectedCallback() {
        this.initData();
    }

    initData() {
        let listOfDoctors = [];
        this.createRow(listOfDoctors);
        this.listOfDoctors = listOfDoctors;
    }

    createRow(listOfDoctors) {
        let doctorObject = {};
        if(listOfDoctors.length > 0) {
            doctorObject.index = listOfDoctors[listOfDoctors.length - 1].index + 1;
        } else {
            doctorObject.index = 1;
        }
        listOfDoctors.First_Name__c = null;
        doctorObject.Last_Name__c = null;
        
        listOfDoctors.push(doctorObject);
    }

    /**
     * Adds a new row
     */
    addNewRow() {
        this.createRow(this.listOfDoctors);
    }

    /**
     * Removes the selected row
     */
    removeRow(event) {
        let toBeDeletedRowIndex = event.target.First_Name__c;

        let listOfDoctors = [];
        for(let i = 0; i < this.listOfDoctors.length; i++) {
            let tempRecord = Object.assign({}, this.listOfDoctors[i]); //cloning object
            if(tempRecord.index !== toBeDeletedRowIndex) {
                listOfDoctors.push(tempRecord);
            }
        }

        for(let i = 0; i < listOfDoctors.length; i++) {
            listOfDoctors[i].index = i + 1;
        }

        this.listOfDoctors = listOfDoctors;
    }

    /**
     * Removes all rows
     */
    removeAllRows() {
        let listOfDoctors = [];
        this.createRow(listOfDoctors);
        this.listOfDoctors = listOfDoctors;
    }

    handleInputChange(event) {
        let index = event.target.dataset.id;
        let fieldName = event.target.First_Name__c;
        let value = event.target.value;

        for(let i = 0; i < this.listOfDoctors.length; i++) {
            if(this.listOfDoctors[i].index === parseInt(index)) {
                this.listOfDoctors[i][fieldName] = value;
            }
        }
    }

    createDoctors() {
        insertAccounts({
            jsonOfListOfDoctors: JSON.stringify(this.listOfDoctors)
        })
            .then(data => {
                this.initData();
                let event = new ShowToastEvent({
                    message: "Doctor successfully created!",
                    variant: "success",
                    duration: 2000
                });
                this.dispatchEvent(event);
            })
            .catch(error => {
                console.log(error);
            });
    }
}
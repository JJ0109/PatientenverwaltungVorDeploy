using { slah.db as slah } from '../db/schema';


//@path: '/sap/opu/odata/sap/API_PATIENT'
service patientservice {

    entity PatientenSet        as projection on slah.Patient;
        annotate  PatientenSet with @odata.draft.enabled;
     

}

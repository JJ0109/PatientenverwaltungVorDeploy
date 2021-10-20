using patientservice as service from '../../srv/patientservice';

using from '../../srv/common';


//Masterpage - List Report
annotate patientservice.PatientenSet with @(UI : {
    SelectionFields: [ 'vorname', 'nachname', 'gebDatum' ],
    LineItem : [
    {
        Label : 'Patientennummer',
        Value : patientenID,
    },
    {
        Label : 'Anrede',
        Value : anrede_code,
    },
    {
        Label : 'Vorname',
        Value : vorname,
    },
    {
        Label : 'Nachname',
        Value : nachname,
    },
    {
        Label : 'Geburtsdatum',
        Value : gebDatum,
    },
    {
        Label : 'Geschlecht',
        Value : geschlecht_code1,
    }
],


//Masterpage - Überschrift
HeaderInfo          : {
        TypeName       : 'Patient',
        TypeNamePlural : 'Patienten',
        Title          : {
            $Type : 'UI.DataField',
            Value : nachname
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : vorname
        },
    },


//ObjectPage - Details zum Patienten
Facets: [
            {
                $Type: 'UI.ReferenceFacet', 
                Label: 'Allgemeine Informationen', 
                Target: '@UI.FieldGroup#Main'
            },      
            {
                $Type: 'UI.ReferenceFacet', 
                Label: 'Adressdaten', 
                Target: '@UI.FieldGroup#Main1'
            },    
            {
                $Type: 'UI.ReferenceFacet', 
                Label: 'Kontaktdaten', 
                Target: '@UI.FieldGroup#Main2'
            },   
        ],
        

FieldGroup#Main: {
            Data: [
                {Value: ID, ![@UI.Hidden] : true },
                {Value: patientenID },
                {Value: versichertenNr},
                {Value: patientNrKIS},
                {Value: anrede_code},
                {Value: titel},
                {Value: vorname } ,  
                {Value: nachname },
                {Value: gebDatum },
                {Value: geschlecht_code1},
                {Value: gesetzVers},
                {Value: krankenkasse}
               
               // {Value: Datenschutz1},
               // {Value: LastChangedDatenschutz}
            ]
        },

FieldGroup#Main1: {
            Data: [
                {Value: adresse_strasse},
                {Value: adresse_hausnr},
                {Value: adresse_zusatz},
                {Value: adresse_postleitzahl},
                {Value: adresse_ort},
                {Value: adresse_postfach},
                {Value: adresse_land_code2},
            ]
        },        

FieldGroup#Main2: {
            Data: [
                {Value: kontakt_telefonnummer},
                {Value: kontakt_mobilnummer},
                {Value: kontakt_fax},
                {Value: kontakt_email}
            ]
        },

});
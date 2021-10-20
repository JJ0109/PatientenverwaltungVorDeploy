namespace slah.db;
using { managed, cuid, sap.common, sap } from '@sap/cds/common';             //sap.common.CodeList,

type Url : String;

//Patientendaten 
entity Patient : managed, cuid
{
    key ID: UUID @(Core.Computed : true);
@FieldControl.Mandatory //not null; 
    patientenID            : String(15) @title : 'Patienten ID'; 
@FieldControl.Mandatory  
    versichertenNr         : String(20) @title : 'VersichertenNr' @assert.range: [ 0, 1000 ]; 
    gesetzVers             : Boolean    @title : 'GesetzVers';
    krankenkasse           : String(30) @title : 'Krankenkasse';
    patientNrKIS           : String(20) @title : 'PatientNrKIS';
@FieldControl.Mandatory     
    anrede                 : Association to one FrauHerr       @title : 'Anrede';
    titel                  : String(20) @title : 'Titel';
@FieldControl.Mandatory     
    

   vorname                : String(45) @title : 'Vorname';



@FieldControl.Mandatory     
    nachname               : String(45) @title : 'Nachname'; 
@FieldControl.Mandatory     
    gebDatum               : Date       @title : 'Geburtsdatum'; 
@FieldControl.Mandatory        
    geschlecht             : Association to one typeGeschlecht @title : 'Geschlecht';
    adresse: Adressdaten;
    kontakt: Kontakdaten;
    datenschutz1           : Boolean    @title : 'Datenschutz1';
    lastChangedDatenschutz : DateTime   @title : 'LastChangedDatenschutz';
}



type Adressdaten {
    land                   : Association to one typeLand       @title : 'Land';
    postleitzahl           : String(10) @title : 'Postleitzahl'; 
    ort                    : String(40) @title : 'Ort'; 
    strasse                : String(45) @title : 'Strasse'; 
    hausnr                 : String(9)  @title : 'Hausnr'; 
    zusatz                 : String(40) @title : 'Zusatz';
    postfach               : String(8)  @title : 'Postfach';
}

type Kontakdaten {
 telefonnummer          : String(20) @title : 'Telefonnummer';
    mobilnummer            : String(20) @title : 'Mobilnummer';
    fax                    : String(20) @title : 'Fax';
@FieldControl.Mandatory 
    //Email                  : String(60) @title : 'Email'; 
    email                  : String(60) @title : 'Email'; 
}







//Entitäten
//Geschlecht
entity typeGeschlecht : GeschlechttypeGeschlecht {}
entity GeschlechttypeGeschlecht : common.CodeList {
    key code1 : String (10);
}

//Anrede 
entity FrauHerr : AnredeFrauHerr {}
entity AnredeFrauHerr : common.CodeList {
    key code : String (10);
}

//Land
entity typeLand : LandtypeLand {}
entity LandtypeLand : common.CodeList {
    key code2 : String(3);
}


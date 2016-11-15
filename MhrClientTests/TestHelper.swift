//
//  TestHelper.swift
//  MhrClient
//
//  Created by Landon Reilly on 10/11/16.
//  Copyright © 2016 Landon Reilly. All rights reserved.
//

import XCTest
import UIKit
import SwiftFHIR
import OAuth2

class TestHelper {
    
    static func checkPatient(patient: SwiftFHIR.Patient, dob: String, familyName: String, givenName: String, id: String, gender: String, ihi: String, indigenousStatus: String, phoneNumber: String, country: String, city: String, postCode: String, state: String, streetLine: String) -> Void
    {
        XCTAssertEqual(dob, patient.birthDate?.asJSON())
        XCTAssertEqual(familyName, patient.name?[0].family?[0].asJSON())
        XCTAssertEqual(givenName, patient.name?[0].given?[0].asJSON())
        XCTAssertEqual(id, patient.id?.asJSON())
        XCTAssertEqual(country, patient.address?[0].country?.asJSON())
        XCTAssertEqual(city, patient.address?[0].city?.asJSON())
        XCTAssertEqual(postCode, patient.address?[0].postalCode?.asJSON())
        XCTAssertEqual(state, patient.address?[0].state?.asJSON())
        XCTAssertEqual(streetLine, patient.address?[0].line?[0].asJSON())
        XCTAssertEqual(gender, patient.gender)
        XCTAssertEqual(phoneNumber, patient.telecom?[0].value)
        XCTAssertEqual(indigenousStatus, patient.extension_fhir?[0].valueCodeableConcept?.coding?[0].display)
        XCTAssertEqual(ihi, patient.identifier?[0].value)
    }
    
    static func checkRelatedPerson(patient: SwiftFHIR.RelatedPerson, dob: String, familyName: String, givenName: String, id: String, gender: String, ihi: String) -> Void
    {
        XCTAssertEqual(dob, patient.birthDate?.asJSON())
        XCTAssertEqual(familyName, patient.name?.family?[0].asJSON())
        XCTAssertEqual(givenName, patient.name?.given?[0].asJSON())
        XCTAssertEqual(id, patient.id?.asJSON())
        XCTAssertEqual(gender, patient.gender!)
        XCTAssertEqual(ihi, patient.identifier?[0].value)
    }
    
    static func getProjectDirectory() -> NSString {
        let dir = #file as NSString
        let proj = (dir.deletingLastPathComponent as NSString).deletingLastPathComponent as NSString
        
        return proj
    }
    
    static func readFileAsJson(path: String) -> FHIRJSON {
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as? FHIRJSON
        
        return json!
    }
}

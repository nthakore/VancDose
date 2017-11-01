//
//  Patient.swift
//  Vancomycin Calculator
//
//  Created by Neha Thakore, PharmD/PhD on 4/19/17.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import UIKit

enum PatientStatus {
    case normal
    case underweight
    case poorClearance
    case underweightAndPoorClearance
}

struct Patient {
    var patientInitials: String
    var weight: Double
    var height: Double
    var age: Int
    var sCr: Double
    var isMaleGender: Bool
    var status: PatientStatus = .normal
    
    init(patientInitials: String, weight: Double, height: Double, age: Int, sCr: Double, isMaleGender: Bool) {
        self.patientInitials = patientInitials
        self.weight = weight
        self.height = height
        self.age = age
        self.sCr = sCr
        self.isMaleGender = isMaleGender
        
        let crcl = VancomycinDosage().calculateCrClFor(patient: self)
        if weight < 45 && crcl < 30 {
            self.status = .underweightAndPoorClearance
        } else if weight < 45 {
            self.status = .underweight
        } else if crcl < 30 {
            self.status = .poorClearance
        } else {
            self.status = .normal
        }  
    }
}

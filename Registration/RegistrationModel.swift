//
//  RegistrationModel.swift
//  Registration
//
//  Created by Gokulkrishna Jayachandran on 14/2/21.
//

import Foundation

import UIKit

class RegistrationModel {
    var registration: String
    var expired: Bool
    var expiryDate: String
    var type: String
    var make: String
    var model: String
    var colour: String
    var vin: String
    var tare_weight: Double
    var gross_mass: Int?
    var name: String
    var code: Int?
    var remainingMonths: Int?
    
 
    init(cregistration: String?, cexpired:Bool?, cexpiryDate:String?, ctype: String?,
         cmake: String?,
         cmodel: String?,
         ccolour: String?,
         cvin: String?,
         ctare_weight: Double?,
         cgross_mass: Int?,
         cname: String?,
         ccode: Int?,
         cremainingMonths: Int?) {
        
        registration = cregistration!
        expired = cexpired!
        expiryDate = cexpiryDate!
        type = ctype!
        make = cmake!
        model = cmodel!
        colour = ccolour!
        vin = cvin!
        tare_weight = ctare_weight!
        gross_mass = cgross_mass
        name = cname!
        code = ccode!
        remainingMonths = cremainingMonths!
        
        
    }
}

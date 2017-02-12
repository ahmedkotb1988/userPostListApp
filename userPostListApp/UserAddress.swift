//
//  UserAddress.swift
//  userPostListApp
//
//  Created by Ahmed kotb on 2/12/17.
//  Copyright © 2017 Ahmed Kotb. All rights reserved.
//

import UIKit

class UserAddress: NSObject {

    var street : NSString?
    var suite : NSString?
    var city : NSString?
    var zipCode : NSString?
    var geoLocation : NSDictionary?
    
    func populateUserAddressWithObject(addressDictionary : NSDictionary) -> UserAddress
    {
        self.street = addressDictionary.object(forKey: "street") as! NSString?
        self.suite = addressDictionary.object(forKey: "suite") as! NSString?
        self.city = addressDictionary.object(forKey: "city") as! NSString?
        self.zipCode = addressDictionary.object(forKey: "zipcode") as! NSString?
        self.geoLocation = addressDictionary.object(forKey: "geo") as! NSDictionary?
        
        return self
    }
}

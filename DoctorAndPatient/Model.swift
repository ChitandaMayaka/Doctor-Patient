//
//  Model.swift
//  DoctorAndPatient
//
//  Created by Shuqing Zhang on 5/2/15.
//  Copyright (c) 2015 Shuqing Zhang & Sihan Chen. All rights reserved.
//

import UIKit
import CoreData
@objc(Model)
class Model: NSManagedObject {
    
    @NSManaged var doctor: String
    @NSManaged var patient: String
    @NSManaged var date: String
   
}

//
//  ViewController.swift
//  DoctorAndPatient
//
//  Created by Shuqing Zhang on 5/2/15.
//  Copyright (c) 2015 Shuqing Zhang & Sihan Chen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var doctorName: UITextField!
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet weak var visitDate: UITextField!
    
    var doctor: String = ""
    var patient: String = ""
    var date: String = ""
    
    var existingApp: NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (existingApp != nil) {
            doctorName.text = doctor
            patientName.text = patient
            visitDate.text = date
        }
    }
    @IBAction func saveTapped(sender: AnyObject) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Appointment", inManagedObjectContext: context)
        
        //check if app exist
        if (existingApp != nil) {
            existingApp.setValue(doctorName.text as String, forKey: "doctor")
            existingApp.setValue(patientName.text as String, forKey: "patient")
            existingApp.setValue(visitDate.text as String, forKey: "date")
        } else {
            
            var newApp = Model(entity: ent!, insertIntoManagedObjectContext: context)
            
            newApp.doctor = doctorName.text
            newApp.patient = patientName.text
            newApp.date = visitDate.text
            
            println(newApp)
            
        }
        context.save(nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    @IBAction func cancelTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true) 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


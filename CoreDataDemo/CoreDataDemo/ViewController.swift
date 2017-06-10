//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Varun on 20/05/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var empIDTextField : UITextField?
    @IBOutlet var empNameTextField : UITextField?
    @IBOutlet var companyRegIDTextField : UITextField?
    @IBOutlet var companyNameTextField : UITextField?
    
    @IBOutlet var employeeTableView : UITableView?
    @IBOutlet var companyTableView : UITableView?
    
    var employeesDataArray : [Employee]?
    var companyDataArray : [Company]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.synchroniseLocalDataWithCore()
    }
    
    func synchroniseLocalDataWithCore(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let empFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        
        let compFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        
        do {
            let fetchedEmps = try context.fetch(empFetch) as! [Employee]
            self.employeesDataArray = fetchedEmps
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
        do {
            let fetchedComps = try context.fetch(compFetch) as! [Company]
            self.companyDataArray = fetchedComps
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let empFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        empFetch.predicate = NSPredicate(format: "id == %@", (self.empIDTextField?.text)!)
        
        let compFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        compFetch.predicate = NSPredicate(format: "regId == %@", (self.companyRegIDTextField?.text)!)
        
        
        do {
            let fetchedEmps = try context.fetch(empFetch) as! [Employee]
            let fetchedComps = try context.fetch(compFetch) as! [Company]
            
            if(fetchedEmps.count == 0 && fetchedComps.count == 0)
            {
                let emp1 = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
                
                let comp = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context) as! Company
                
                emp1.id = empIDTextField?.text
                emp1.name = empNameTextField?.text
                emp1.company = comp
                
                comp.regId = companyRegIDTextField?.text
                comp.name = companyNameTextField?.text
                comp.addToEmployees(emp1)
            }
            else if(fetchedEmps.count == 0 && fetchedComps.count > 0){
                let emp1 = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
                
                let managedObjectForComp = fetchedComps[0]
                managedObjectForComp.setValue(self.companyNameTextField?.text, forKey: "name")
                
                emp1.id = empIDTextField?.text
                emp1.name = empNameTextField?.text
                emp1.company = managedObjectForComp
                
            }
            else if(fetchedEmps.count > 0  && fetchedComps.count == 0){
                
                let comp = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context) as! Company
                
                let managedObjectForEmp = fetchedEmps[0]
                managedObjectForEmp.setValue(self.empNameTextField?.text, forKey: "name")
                
                comp.regId = companyRegIDTextField?.text
                comp.name = companyNameTextField?.text
                comp.addToEmployees(managedObjectForEmp)
                
            }else{
                
                let managedObjectForComp = fetchedComps[0]
                managedObjectForComp.setValue(self.companyNameTextField?.text, forKey: "name")
                
                let managedObjectForEmp = fetchedEmps[0]
                managedObjectForEmp.setValue(self.empNameTextField?.text, forKey: "name")
            }
            
        }
        catch{
            fatalError("Failed to fetch employees: \(error)")
        }
        
        appDelegate.saveContext()
        
        self.synchroniseLocalDataWithCore()
        self.employeeTableView?.reloadData()
        self.companyTableView?.reloadData()
        
    }
    
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let empFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        empFetch.predicate = NSPredicate(format: "id == %@", "1")
        
        do {
            let fetchedEmps = try context.fetch(empFetch) as! [Employee]
            
            for emp in fetchedEmps {
                print("Id: \(emp.id!)\nName: \(emp.name!)\nComapny name: \(emp.company?.name!)\n\n")
            }
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1{
            let empCell = tableView.dequeueReusableCell(withIdentifier: "empCell")
            
            empCell?.textLabel?.text = "\((employeesDataArray?[indexPath.row].name)!)  \((employeesDataArray?[indexPath.row].id)!) "
            return empCell!
            
        }else {//if tableView.tag == 2 {
            let compCell = tableView.dequeueReusableCell(withIdentifier: "compCell")
            
            compCell?.textLabel?.text = "\((companyDataArray?[indexPath.row].name)!)  \((companyDataArray?[indexPath.row].regId)!)"
            return compCell!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
            return (self.employeesDataArray?.count)!
        }else if tableView.tag == 2{
            return (self.companyDataArray?.count)!
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        if tableView.tag == 1{
//            
//        }else if tableView.tag == 2{
//            
//        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if tableView.tag == 1{
            let empFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
            empFetch.predicate = NSPredicate(format: "id == %@",(employeesDataArray?[indexPath.row].id!)! )
            
            do {
                let fetchedEmps = try context.fetch(empFetch) as! [Employee]
                
                self.empIDTextField?.text =  fetchedEmps[0].id
                self.empNameTextField?.text = fetchedEmps[0].name
                
            } catch {
                fatalError("Failed to fetch employees: \(error)")
            }
            
        }else if tableView.tag == 2{
            let compFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
            compFetch.predicate = NSPredicate(format: "regId == %@", (companyDataArray?[indexPath.row].regId!)! )
            
            do {
                let fetchedComps = try context.fetch(compFetch) as! [Company]
                
                self.companyRegIDTextField?.text =  fetchedComps[0].regId
                self.companyNameTextField?.text = fetchedComps[0].name
                
            } catch {
                fatalError("Failed to fetch employees: \(error)")
            }
        }
    }
}


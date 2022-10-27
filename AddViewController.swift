//
//  AddViewController.swift
//  Notes
//
//  Created by Jomms on 22/10/22.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    @IBOutlet var txtlbl: UITextField!
    
    @IBOutlet var txtlbl2: UITextView!
    
    @IBOutlet var btnsave: UIBarButtonItem!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.reloadInputViews()
        
    }
    

    @IBAction func btn_save(_ sender: Any) {
        //let notes = self.txtlbl.text
        //let dis = self.txtlbl2.text
        let result = NSEntityDescription.insertNewObject(forEntityName:"Notes",into: context)// country is entity name
      //  let entity = NSEntityDescription.entity(forEntityName:"Notes", in: context)
        //    let result = NSManagedObject(entity: entity!, insertInto: context)
           // newData.setValue("fdsafdsfadf", forKey: "id")
                
                
                 result.setValue(self.txtlbl.text, forKey:"note") //  set value in txt1 into attribute named "note"
                result.setValue(self.txtlbl2.text, forKey: "discription")
                
                
                do        // saving the value to core data
                {
                    try context.save()
                
                }
                catch
                {
                    print("error")
                }
       /* let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "main") as! ViewController
        *///self.present(nextViewController, animated:true, completion:nil)
        let newView2 : ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as! ViewController

        if let navCtrl = self.navigationController
        {
           navCtrl.pushViewController(newView2, animated: true)
        }
        else
        {
           let navCtrl = UINavigationController(rootViewController: newView2)
            self.present(navCtrl, animated: true, completion: nil)
        }
        
        
        
    }
    
}

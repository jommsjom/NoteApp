//
//  EditViewController.swift
//  Notes
//
//  Created by Jomms on 22/10/22.
//

import UIKit
import CoreData

class EditViewController: UIViewController {
    
    var str = NSString()
    var str1 = NSString()
    
    
    @IBOutlet weak var titleeditt_txt: UITextField!
    @IBOutlet weak var disedit_txtview: UITextView!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        titleeditt_txt!.text = str as! String
        disedit_txtview!.text = str1 as! String
    }
  
    @IBAction func btn_done(_ sender: Any) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
      
        
        do
        {
            let test = try context.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue(self.titleeditt_txt.text, forKey: "note")
            objectUpdate.setValue(self.disedit_txtview.text, forKey: "discription")
           
            
            do{
                try context.save()
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }
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
    
    @IBAction func cancel_btn(_ sender: Any) {
        
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

//
//  SearchViewController.swift
//  Notes
//
//  Created by Jomms on 22/10/22.
//

import UIKit
import CoreData

class SearchViewController: UIViewController {
    
    @IBOutlet weak var search_txt: UITextField!
    
    @IBOutlet weak var title_lbl: UILabel!
    
    @IBOutlet weak var des_lbl: UILabel!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        
    }
    
    
    
    @IBAction func search_btn(_ sender: Any) {
        
        // fetching the contents in the entity named country to request
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        // the string we enter in the text field moved to searchstring
        let searchstring = self.search_txt.text
        // predicate is a condition which will check the string we entered in txt field equal to the contents in the atribute named "name"
        request.predicate = NSPredicate(format: "note == %@", searchstring!)
        // a variable is taken to store result
         var outputstr = ""
        var outputstr1 = ""
        
        do{
            // fetching the contents in request to a variable named result
            let result = try context.fetch(request)
            // if there is value in result the count will increase ie if there is no value count is 0 if there is value count will greater than 0
            if result.count > 0
            {
                // the contents in result is in oneline  eg for i in 0...5   ie 0 to 5 in i
                for oneline in result
                {
                    //   name in oneline is in onecity
                    let onecity = (oneline as AnyObject).value(forKey: "note") as! String
                    //   language is in onelanguage
                    let onelanguage = (oneline as AnyObject).value(forKey: "discription") as! String
                    // color is in onecolour
                  //  let onecolour = (oneline as AnyObject).value(forKey: "color") as! String
                    
                    // these are stored in outputstr
                    outputstr = onecity
                    outputstr1 = onelanguage
                    
                }
            }
            
            else
            {
                outputstr = "no match found"
            }
            
            self.title_lbl.text = outputstr
            self.des_lbl.text = outputstr1
        }
        
        catch
        {
            print("error")
        }
        
        
        
        
        
        
        
        
    }
    
    
    @IBAction func done_btn(_ sender: Any) {
        let newView : ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as! ViewController

        if let navCtrl = self.navigationController
        {
           navCtrl.pushViewController(newView, animated: true)
        }
        else
        {
           let navCtrl = UINavigationController(rootViewController: newView)
            self.present(navCtrl, animated: true, completion: nil)
        }
        
    }
    
}

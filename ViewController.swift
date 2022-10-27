//
//  ViewController.swift
//  Notes
//
//  Created by Jomms on 20/10/22.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var newnotes = [Notes]()
    var str:NSString!
    var str1:NSString!
    var cell = TableViewCell()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newnotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let onrecord = newnotes[indexPath.row]
        
        cell.lbltitle?.text = onrecord.note!
        cell.lbldescription?.text = onrecord.discription!
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "edit") as! EditViewController
    let indexPath = tblview.indexPathForSelectedRow //optional, to get from any
        
        nextViewController.str = cell.lbltitle!.text as! NSString
        nextViewController.str1 = cell.lbldescription!.text as! NSString
        
       
      self.present(nextViewController, animated:true, completion:nil)
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

    @IBOutlet var tblview: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblview.delegate = self
        tblview.dataSource = self
        self.fetchdata()
        //self.tblview.reloadData()
      //  self.tblview.rowHeight = 200;
        
        
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete
        {
            let city = newnotes[indexPath.row]
            context.delete(city)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do
            {
                newnotes = try! context.fetch(Notes.fetchRequest())
            }
            catch
            {
                print("error")
            }
        }
       tblview.reloadData()
    }
    func fetchdata ()
    {
        let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
        
        do
        {
            newnotes = try context.fetch(Notes.fetchRequest())
        }
        catch
        {
            print("error")
        }
        tblview.reloadData()
    }
    
    
    @IBAction func btnsearch(_ sender: Any) {
        
    
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "add") as! AddViewController
        
       */// self.present(nextViewController, animated:true, completion:nil)
        let newView1 : SearchViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "search") as! SearchViewController
        if let navCtrl = self.navigationController
        {
           navCtrl.pushViewController(newView1, animated: true)
        }
        else
        {
           let navCtrl = UINavigationController(rootViewController: newView1)
            self.present(navCtrl, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func btnadd(_ sender: Any) {
        
      
        let newView : SearchViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "search") as! SearchViewController

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


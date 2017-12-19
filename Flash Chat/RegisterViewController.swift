//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil{
                print(error!)
                SVProgressHUD.dismiss()
                let alert2 = UIAlertController(title: "ERROR", message: "Invalid limit", preferredStyle: .alert)
                
                let action2 = UIAlertAction(title: "Reset", style: .default, handler: { (UIAlertAction) in
                    self.emailTextfield.text = ""
                    self.passwordTextfield.text = ""
                })
                alert2.addAction(action2)
                self.present(alert2, animated: true, completion: nil)
                
            }
            else{
                print("Registration successfull")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
        

        
        
    } 
    
    
}

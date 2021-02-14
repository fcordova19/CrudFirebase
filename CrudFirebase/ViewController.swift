//
//  ViewController.swift
//  CrudFirebase
//
//  Created by desarrollo on 13/2/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var control: UISegmentedControl!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        if control.selectedSegmentIndex == 0
        {
            startSession(email: email.text!, password: password.text!)
        }
        else
        {
            register(email: email.text!, password: password.text!)
        }
        
    }
    
    func startSession(email: String, password: String)
    {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if user != nil
            {
                self.performSegue(withIdentifier: "inicio", sender: self)
            }
            else
            {
                if let error = error?.localizedDescription{
                    print("error firebase en el inicio de sesino: ", error)
                }
                else{
                    print("error de codigo: ")
                }
            }
        }
    }
    
    func register(email: String, password: String)
    {
        Auth.auth().createUser(withEmail: email, password: password) { ( user, error) in
            if user != nil
            {
                self.performSegue(withIdentifier: "inicio", sender: self)
            }
            else
            {
                if let error = error?.localizedDescription{
                    print("error firebase en el registro: ", error)
                }
                else{
                    print("error de codigo: ")
                }
            }
        }
    }
}


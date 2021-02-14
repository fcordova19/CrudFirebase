//
//  InicioController.swift
//  CrudFirebase
//
//  Created by desarrollo on 14/2/21.
//

import UIKit
import FirebaseAuth

class InicioController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = Auth.auth().currentUser?.email
        print("el ususario es:  \(email) ")
    }
    
    @IBAction func btnExit(_ sender: UIButton) {
        try! Auth.auth().signOut()
        
        performSegue(withIdentifier: "login", sender: self)
    }
    

}

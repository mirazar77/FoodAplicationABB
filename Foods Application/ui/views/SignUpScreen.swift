import UIKit
import Firebase
import FirebaseAuth
class SignUpScreen: UIViewController {

    
    @IBOutlet weak var imgCube: UIImageView!
 
    //@IBOutlet weak var lblConnect: UILabel!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblPassword: UILabel!
    
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
  
    
    
    @IBAction func btnCreateAccount(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("Error")
            } else {
                // Go to our Home
                self.performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
    
    
    @IBAction func btnGooglee(_ sender: Any) {
    }
    @IBAction func btnApplee(_ sender: Any) {
    }
    
    
}

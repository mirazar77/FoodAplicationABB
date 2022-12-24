import UIKit
import Firebase
import FirebaseAuth
class LoginScreen: UIViewController {

    @IBOutlet weak var imgCube: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblDont: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    @IBAction func btnLogin(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("Error")
            } else {
                // Go to our Home
                self.performSegue(withIdentifier: "goToNextt", sender: self)
            }
        }
    }
    @IBAction func btnApple(_ sender: Any) {
    }
    @IBAction func btnGoogle(_ sender: Any) {
    }
    @IBAction func btnSignUp(_ sender: Any) {
    }
}

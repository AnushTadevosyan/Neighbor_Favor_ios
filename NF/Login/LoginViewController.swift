//
//  LoginViewController.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/8/22.
//

import UIKit

class LoginViewController: UIViewController {

    
    var temp = false
    //MARK: -CONNECTIONS
    
    @IBOutlet weak var neighborFavorLbl: UILabel!
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var view_1: UIView!
    
    @IBOutlet weak var view_2: UIView!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var noaccountLbl: UILabel!
    
    @IBOutlet weak var registerBtn: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
        loginBtn.applyGradient(colors: [UIColor(named:"LightBlue")!.cgColor, UIColor(named:"DarkBlue")!.cgColor])
        registerBtn.applyGradient(colors: [UIColor(named:"LightBlue")!.cgColor, UIColor(named:"DarkBlue")!.cgColor])
                
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    
    func isUser(){
        if(temp == true){
        print("in the func")
        print(defaults.value(forKey: "isUser")!)
            
        self.performSegue(withIdentifier: "logindash", sender: self)
        }
    }
    
    @IBAction func loginPressed(_ button: UIButton){

        
        guard let email = emailTxtField.text else { return }
        guard let password = passwordTxtField.text else {return}
        
        let login = LoginModel(email: email, password: password)
        APIManager.shareInstance.loginUserAPI(login: login)
        
        let userID = defaults.value(forKey: "userID")
        if(defaults.bool(forKey: "isUser")==true
           && (userID != nil)){
            
            defaults.removeObject(forKey: "isUser")
            self.performSegue(withIdentifier: "logindash", sender: self)
            
        }else{
            defaults.removeObject(forKey: "isUser")
            return
        }
        
   
        


    }
    
    @IBAction func registerPressed(_ button: UIButton){
        self.performSegue(withIdentifier: "gotoregister", sender: registerBtn)
        
    }
}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if(textField==emailTxtField){
            
            view_1.backgroundColor = UIColor(named: "DarkBlue")
            view_2.backgroundColor = UIColor(named: "LightBlue")
            
            }else{
                
            view_2.backgroundColor = UIColor(named: "DarkBlue")
            view_1.backgroundColor = UIColor(named: "LightBlue")
                                             
            }
    }
    

}


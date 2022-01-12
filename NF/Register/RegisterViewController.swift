//
//  RegisterViewController.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/11/22.
//

import UIKit

var registerr = RegisterModel()

class RegisterViewController: UIViewController{

    
    var infoNames = ["First Name", "Last Name", "Email", "Password", "Phone Number"]
    var placeHolders = ["Enter your first name", "Enter your last name", "Enter your email", "Enter your password", "Enter your phone number"]
    var firstname = "",  lastname = "",  email="",  password = "",  phoneNumber = ""
    
    @IBOutlet weak var NFLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerBtn.applyGradient(colors: [UIColor(named:"LightBlue")!.cgColor, UIColor(named:"DarkBlue")!.cgColor])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.register(RegisterTableViewCell.self, forCellReuseIdentifier: "registercell")

    }
    
    
    @objc func textFieldDidChange(textfield: UITextField, view: UIView) {
      

        switch textfield.tag {
        case 0:
           firstname  = textfield.text!
        

        case 1:
            lastname = textfield.text!

        case 2:
           email = textfield.text!

        case 3:
            password  = textfield.text!
            textfield.isSecureTextEntry = true

        case 4:
            phoneNumber   = textfield.text!
            

        default:
            break
        }
        
        registerr = RegisterModel(fname: firstname, lname: lastname, fhone: phoneNumber, mail: email, pass: password, fvask: 0, fvsdone: 0)
  
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        
        if(firstname.count==0 || lastname.count == 0 ||  email.count==0 || phoneNumber.count==0 || password.count==0){
            let alert = UIAlertController(title: "Alert", message: "At least one of the registration fields is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

            }))
            self.present(alert, animated: true, completion: nil)
            return
        }

        
    

            APIManager.shareInstance.registerUserAPI(register: registerr) { (isSuccess, str)  in
                if isSuccess{
                    let alert = UIAlertController(title: "Alert", message: str, preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    alert.dismiss(animated: true, completion: nil)
                    print("Success")
                }
                else{
                    let alert = UIAlertController(title: "Alert", message: str, preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    alert.dismiss(animated: true, completion: nil)
                    print("Fail")
                }
            }
    }
    
    


}

extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return infoNames.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "registercell") as! RegisterTableViewCell
            
            cell.selectionStyle = .none
            cell.infoLbl?.text = infoNames[indexPath.row]
            cell.textFld?.placeholder=placeHolders[indexPath.row]
            cell.textFld.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            cell.recView?.backgroundColor = UIColor(named: "DarkBlue")
            cell.textFld.tag = indexPath.row
            
            return cell
        }
    
    
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 120.0;//Your custom row height
    }
       
    
    
    
}

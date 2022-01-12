//
//  APIManager.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/8/22.
//

import Foundation
import Alamofire


var userid = [String]()

class APIManager{
    
    
    static let shareInstance = APIManager()
    
    
//MARK: -LOGIN
    
    func loginUserAPI(login:LoginModel){
     
        var userid = ""
        guard let loginString  = URL(string: "\(login_url)email=\(login.email)&password=\(login.password)")else {
            print("invalid url")
            return 
        }
        let task = URLSession.shared.dataTask(with: loginString){
       
            (data, response,error) in
            guard let data = data else {
               return
            }
             
             print("1st")
            let str = String(decoding: data, as: UTF8.self)
             if(str.count < 3){
              
                 defaults.set(false, forKey: "isUser")
                 
             }else{
              
                 defaults.set(true, forKey: "isUser")
             }
             
             var newStr = ""
             for i in str{
                 if(i.isNumber == true){
                     newStr.append(i)
                 }
             }
            userid.append(newStr)
            defaults.set(newStr, forKey: "userID")
             print("in login function")
             print(newStr) //userid
            print(defaults.bool(forKey: "isUser"))
       
       
       
               }
               task.resume()
        
    }
    
    
    //MARK: -REGISTER
    func registerUserAPI(register: RegisterModel, completionHandler: @escaping (Bool, String)->()){

        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            
            debugPrint(response)
        
            switch response.result{
            
                case .success(let data):
                    do {
                       
             let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        if(response.response?.statusCode == 200){
                            completionHandler(true, "User registered successfully")
                        }else{
                            completionHandler(false,"Please try again")
                        }
//                    print(json)
                        
                        
                    } catch{
                    
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    completionHandler(false,"Error. Something went wrong")
                    
            }
            
          }
        }
    
    

}

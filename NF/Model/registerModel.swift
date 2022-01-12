//
//  registerModel.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/11/22.
//

import Foundation

struct RegisterModel: Encodable{
    
    let firstname: String
    let lastname: String
    let phone: String
    let email: String
    let password: String
    let favorasked: Int
    let favorsdone: Int

    
    init(){
        firstname = " "
        lastname = " "
        phone = " "
        email = " "
        password = " "
        favorasked = -1
        favorsdone = -1

    }
    
    init(fname: String, lname: String, fhone: String, mail: String, pass: String, fvask: Int, fvsdone: Int){
        
        firstname = fname
        lastname = lname
        phone = fhone
        email = mail
        password = pass
        favorasked = fvask
        favorsdone = fvsdone
    }
    
}

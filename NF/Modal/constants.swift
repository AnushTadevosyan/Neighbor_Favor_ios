//
//  constants.swift
//  NF
//
//  Created by Anush Tadevosyan on 1/8/22.
//

import Foundation


let base_url = "https://neighbor-favor.herokuapp.com"
let post_favor_url = "\(base_url)/list-favor"
let register_url = "\(base_url)/post-user"
let post_login_url = "\(base_url)/get-user-details" //sending this after login, so the user stays logged in
let login_url = "\(base_url)/login?"
//email=\(email)&password=\(password)"
let leaderboard_url = "\(base_url)/get-leaderboard" //to see all user info
let get_all_pending_favors_url = "\(base_url)/get-all-pending-favors"
let get_user_posted_favors_url = "\(base_url)/get-user-listed-favors"
let get_user_favors_completed_by_other_url = "\(base_url)/get-user-previous-favors" //completed favors posted by users (other have completed)
let get_user_completed_favors_url = "\(base_url)/get-user-completed-favors"
let user_to_complete_favor_url = "\(base_url)/complete-favor"
let user_post_favor_url = "\(base_url)/list-favor"
let get_user_details = "\(base_url)/get-user-details?userid="





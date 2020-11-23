//
//  UIStoryboard + Extensions.swift
//  SnapSkin
//
//  Created by macOS on 12/16/19.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

enum StoryboardNames : String {
    case Main
    case OnlineConsultation
    case Camera
    case Legacy
    case FAQs
    case ChangePassword
    case UpdateProfile
    case SideMenu
    case Home
    case ChooseSpecificDoctor
    case DoctorList
    case CaseDetails
    case ContactUs
    case Notification
}
extension UIStoryboard{
    func instantiateViewController <controller : UIViewController> () -> controller  {
        return self.instantiateViewController(withIdentifier: String(describing: controller.self)) as! controller
    }
    
}

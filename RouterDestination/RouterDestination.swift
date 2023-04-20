//
//  RouterDestination.swift
//  RouterDestination
//
//  Created by adityo.rancaka on 2023/04/21.
//

import Helpers
import Router
import UIKit

extension UIApplication {
    @Once public static var router: Router<WorldDestination>!
}

public enum WorldDestination {
    case home
    case japan(JapanDestination)
    case indonesia(IndonesiaDestination)
}

public enum JapanDestination {
    case tokyo(Int)
    case osaka
    case presentTokyo(Int)
}

public enum IndonesiaDestination {
    case jakarta
    case bali
}

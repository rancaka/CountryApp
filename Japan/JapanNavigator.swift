import Router
import UIKit

public func japanNavigator(_ destination: JapanDestination, navigationController: UINavigationController) {
    switch destination {
    case .tokyo(let param):
        let tokyo = Tokyo(param: param)
        navigationController.pushViewController(tokyo, animated: true)
    case .osaka:
        let osaka = Osaka()
        navigationController.pushViewController(osaka, animated: true)
    case .presentTokyo(let param):
        let tokyo = Tokyo(param: param)
        navigationController.present(tokyo, animated: true)
    }
}

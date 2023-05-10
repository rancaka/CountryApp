import Router
import UIKit

public func indonesiaNavigator(_ destination: IndonesiaDestination, navigationController: UINavigationController) {
    switch destination {
    case .jakarta:
        let jakarta = Jakarta()
        navigationController.pushViewController(jakarta, animated: true)
    case .bali:
        let bali = Bali()
        navigationController.present(bali, animated: true)
    }
}

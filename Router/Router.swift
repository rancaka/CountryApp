import UIKit

public final class AppCoordinator<Destination> {

    private let navigationController: UINavigationController
    private let navigator: (Destination, UINavigationController) -> Void

    public init(navigationController: UINavigationController, navigator: @escaping (Destination, UINavigationController) -> Void) {
        self.navigator = navigator
        self.navigationController = navigationController
    }

    public func goTo(_ destination: Destination) {
        navigator(destination, navigationController)
    }

    public func goBack(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }

    public func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }

    public func scope<LocalDestination>(
        _ toGlobalDestination: @escaping (LocalDestination) -> Destination
    ) -> AppCoordinator<LocalDestination> {
        AppCoordinator<LocalDestination>(navigationController: navigationController) { localDestination, navigationController in
            self.navigator(toGlobalDestination(localDestination), navigationController)
        }
    }
}

extension UIApplication {
    @Once public static var coordinator: AppCoordinator<WorldDestination>!
}

@propertyWrapper
public struct Once<Value> {
    private var _wrappedValue: Value?
    public var wrappedValue: Value! {
        get { _wrappedValue }
        set {
            if _wrappedValue != nil { return }
            _wrappedValue = newValue
        }
    }

    public init() {}
}

public enum WorldDestination {
    case home
    case indonesia(IndonesiaDestination)
    case japan(JapanDestination)
}

public enum IndonesiaDestination {
    case jakarta
    case bali
}

public enum JapanDestination {
    case tokyo(Int)
    case osaka
}

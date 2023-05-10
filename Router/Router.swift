import UIKit

public final class AppCoordinator<Destination> {

    private let navigationController: UINavigationController
    private let router: (Destination, UINavigationController) -> Void

    public init(navigationController: UINavigationController, router: @escaping (Destination, UINavigationController) -> Void) {
        self.router = router
        self.navigationController = navigationController
    }

    public func goTo(_ destination: Destination) {
        router(destination, navigationController)
    }

    public func scope<LocalDestination>(
        _ toGlobalDestination: @escaping (LocalDestination) -> Destination
    ) -> AppCoordinator<LocalDestination> {
        AppCoordinator<LocalDestination>(navigationController: navigationController) { localDestination, navigationController in
            self.router(toGlobalDestination(localDestination), navigationController)
        }
    }
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

extension UIApplication {
    @Once public static var coordinator: AppCoordinator<WorldDestination>!
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

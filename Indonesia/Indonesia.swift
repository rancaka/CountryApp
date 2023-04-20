//
//  Indonesia.swift
//  Indonesia
//
//  Created by adityo.rancaka on 2023/04/21.
//

import Router
import RouterDestination
import UIKit

class Jakarta: UIViewController {

    let indonesiaRouter = UIApplication.router.scope(WorldDestination.indonesia)

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Jakarta"
        view.backgroundColor = .white

        let iconLabel = UILabel()
        iconLabel.text = "🇮🇩"
        iconLabel.font = .systemFont(ofSize: 75)

        let goToBaliButton = UIButton()
        goToBaliButton.backgroundColor = .brown
        goToBaliButton.setTitle("Present Bali 🏝️", for: .normal)
        goToBaliButton.addTarget(self, action: #selector(goToBali), for: .touchUpInside)

        let goToOsakaButton = UIButton()
        goToOsakaButton.backgroundColor = .purple
        goToOsakaButton.setTitle("Go to Osaka 🎏", for: .normal)
        goToOsakaButton.addTarget(self, action: #selector(goToOsaka), for: .touchUpInside)

        let vStack = UIStackView(arrangedSubviews: [
            iconLabel,
            goToBaliButton,
            goToOsakaButton
        ])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            goToBaliButton.widthAnchor.constraint(equalToConstant: 150),
            goToOsakaButton.widthAnchor.constraint(equalToConstant: 150),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goToBali() {
        indonesiaRouter.goTo(.bali)
    }

    @objc func goToOsaka() {
        UIApplication.router.goTo(.japan(.osaka))
    }
}

class Bali: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Bali"
        view.backgroundColor = .white

        let iconLabel = UILabel()
        iconLabel.text = "🏝️"
        iconLabel.font = .systemFont(ofSize: 75)

        let dismissButton = UIButton()
        dismissButton.backgroundColor = .black
        dismissButton.setTitle("Dismiss 🔙", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissB), for: .touchUpInside)

        let vStack = UIStackView(arrangedSubviews: [
            iconLabel,
            dismissButton
        ])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            dismissButton.widthAnchor.constraint(equalToConstant: 150),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func dismissB() {
        dismiss(animated: true)
    }
}

public func indonesiaRouter(_ destination: IndonesiaDestination, navigationController: UINavigationController) {
    switch destination {
    case .jakarta:
        let jakarta = Jakarta()
        navigationController.pushViewController(jakarta, animated: true)
    case .bali:
        let bali = Bali()
        navigationController.present(bali, animated: true)
    }
}

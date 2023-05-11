//
//  Jakarta.swift
//  Indonesia
//
//  Created by adityo.rancaka on 2023/05/10.
//

import Router
import UIKit

class Jakarta: UIViewController {

    let indonesiaRouter = UIApplication
        .coordinator
        .scope(WorldDestination.indonesia)

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
        goToBaliButton.addTarget(self, action: #selector(presentBali), for: .touchUpInside)

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

    @objc func presentBali() {
        indonesiaRouter.goTo(.bali)
    }

    @objc func goToOsaka() {
        UIApplication.coordinator.goTo(.japan(.osaka))
    }
}

import SwiftUI
import Helpers

struct Jakarta_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(viewController: Jakarta())
    }
}

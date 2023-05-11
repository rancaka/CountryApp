//
//  Osaka.swift
//  Japan
//
//  Created by adityo.rancaka on 2023/05/10.
//

import Router
import UIKit

class Osaka: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Osaka"
        view.backgroundColor = .white

        let iconLabel = UILabel()
        iconLabel.text = "🎏"
        iconLabel.font = .systemFont(ofSize: 75)

        let goToTokyoButton = UIButton()
        goToTokyoButton.backgroundColor = .gray
        goToTokyoButton.setTitle("Go to Tokyo 🗼", for: .normal)
        goToTokyoButton.addTarget(self, action: #selector(goToTokyo), for: .touchUpInside)

        let backButton = UIButton()
        backButton.backgroundColor = .black
        backButton.setTitle("Go Back 🔙", for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        let vStack = UIStackView(arrangedSubviews: [
            iconLabel,
            goToTokyoButton,
            backButton
        ])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            goToTokyoButton.widthAnchor.constraint(equalToConstant: 150),
            backButton.widthAnchor.constraint(equalToConstant: 150),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goToTokyo() {
        UIApplication.coordinator.goTo(.japan(.tokyo(5)))
    }

    @objc func goBack() {
        UIApplication.coordinator.goBack(animated: true)
    }
}

import SwiftUI
import Helpers

struct Osaka_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(viewController: Osaka())
    }
}

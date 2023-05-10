//
//  Jakarta.swift
//  Indonesia
//
//  Created by adityo.rancaka on 2023/05/10.
//

import UIKit

class Jakarta: UIViewController {

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

    }

    @objc func goToOsaka() {

    }
}

import SwiftUI
import Helpers

struct Jakarta_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(viewController: Jakarta())
    }
}

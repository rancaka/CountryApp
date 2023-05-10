//
//  Osaka.swift
//  Japan
//
//  Created by adityo.rancaka on 2023/05/10.
//

import UIKit

class Osaka: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Osaka"
        view.backgroundColor = .white

        let iconLabel = UILabel()
        iconLabel.text = "🎏"
        iconLabel.font = .systemFont(ofSize: 75)

        let presentTokyoButton = UIButton()
        presentTokyoButton.backgroundColor = .gray
        presentTokyoButton.setTitle("Present Tokyo 🗼", for: .normal)
        presentTokyoButton.addTarget(self, action: #selector(presentTokyo), for: .touchUpInside)

        let backButton = UIButton()
        backButton.backgroundColor = .black
        backButton.setTitle("Go Back 🔙", for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        let vStack = UIStackView(arrangedSubviews: [
            iconLabel,
            presentTokyoButton,
            backButton
        ])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            presentTokyoButton.widthAnchor.constraint(equalToConstant: 150),
            backButton.widthAnchor.constraint(equalToConstant: 150),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func presentTokyo() {

    }

    @objc func goBack() {

    }
}

import SwiftUI
import Helpers

struct Osaka_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(viewController: Osaka())
    }
}

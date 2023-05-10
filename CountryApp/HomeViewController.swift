//
//  HomeViewController.swift
//  CountryApp
//
//  Created by adityo.rancaka on 2023/04/21.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let iconLabel = UILabel()
        iconLabel.text = "🌏"
        iconLabel.font = .systemFont(ofSize: 75)

        let goToTokyoButton = UIButton()
        goToTokyoButton.backgroundColor = .lightGray
        goToTokyoButton.setTitle("Go to Tokyo 🗼", for: .normal)
        goToTokyoButton.addTarget(self, action: #selector(goToTokyo), for: .touchUpInside)

        let goToJakartaButton = UIButton()
        goToJakartaButton.backgroundColor = .magenta
        goToJakartaButton.setTitle("Go to Jakarta 🇮🇩", for: .normal)
        goToJakartaButton.addTarget(self, action: #selector(goToJakarta), for: .touchUpInside)

        let vStack = UIStackView(arrangedSubviews: [
            iconLabel,
            goToTokyoButton,
            goToJakartaButton
        ])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            goToTokyoButton.widthAnchor.constraint(equalToConstant: 150),
            goToJakartaButton.widthAnchor.constraint(equalToConstant: 150),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goToTokyo() {

    }

    @objc func goToJakarta() {
        
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(viewController: HomeViewController())
    }
}

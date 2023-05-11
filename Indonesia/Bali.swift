//
//  Bali.swift
//  Indonesia
//
//  Created by adityo.rancaka on 2023/05/10.
//

import UIKit

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
        UIApplication.coordinator.dismiss(animated: true)
    }
}

import SwiftUI
import Helpers

struct Bali_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(viewController: Bali())
    }
}

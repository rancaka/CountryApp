//
//  Tokyo.swift
//  Japan
//
//  Created by adityo.rancaka on 2023/05/10.
//

import UIKit

class Tokyo: UIViewController {
    let param: Int

    init(param: Int) {
        self.param = param
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tokyo"
        view.backgroundColor = .white

        let iconLabel = UILabel()
        iconLabel.text = "🗼"
        iconLabel.font = .systemFont(ofSize: 75)

        let goToOsakaButton = UIButton()
        goToOsakaButton.backgroundColor = .purple
        goToOsakaButton.setTitle("Go to Osaka 🎏", for: .normal)
        goToOsakaButton.addTarget(self, action: #selector(goToOsaka), for: .touchUpInside)

        let goToJakartaButton = UIButton()
        goToJakartaButton.backgroundColor = .magenta
        goToJakartaButton.setTitle("Go to Jakarta 🇮🇩", for: .normal)
        goToJakartaButton.addTarget(self, action: #selector(goToJakarta), for: .touchUpInside)

        let vStack = UIStackView(arrangedSubviews: [
            iconLabel,
            goToOsakaButton,
            goToJakartaButton
        ])
        vStack.axis = .vertical
        vStack.alignment = .center
        vStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            goToOsakaButton.widthAnchor.constraint(equalToConstant: 150),
            goToJakartaButton.widthAnchor.constraint(equalToConstant: 150),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func goToOsaka() {
        
    }

    @objc func goToJakarta() {

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI
import Helpers

struct Tokyo_Previews: PreviewProvider {
    static var previews: some View {
        ViewController(viewController: Tokyo(param: 5))
    }
}

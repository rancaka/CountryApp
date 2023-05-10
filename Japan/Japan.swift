//
//  Japan.swift
//  Japan
//
//  Created by adityo.rancaka on 2023/04/21.
//

import Router
import RouterDestination
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
        UIApplication.router.goTo(.japan(.osaka))
    }

    @objc func goToJakarta() {

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
        UIApplication.router.goTo(.japan(.presentTokyo(7)))
    }

    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

public func japanRouter(_ destination: JapanDestination, navigationController: UINavigationController) {
    switch destination {
    case .tokyo(let param):
        let tokyo = Tokyo(param: param)
        navigationController.pushViewController(tokyo, animated: true)
    case .osaka:
        let osaka = Osaka()
        navigationController.pushViewController(osaka, animated: true)
    case .presentTokyo(let param):
        let tokyo = Tokyo(param: param)
        navigationController.present(tokyo, animated: true)
    }
}

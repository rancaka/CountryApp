//
//  ViewController.swift
//  CountryApp
//
//  Created by adityo.rancaka on 2023/04/21.
//

import SwiftUI

struct ViewController<ViewController: UIViewController>: UIViewControllerRepresentable {

    let viewController: ViewController

    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {

    }
}

//
//  ViewController.swift
//  Helpers
//
//  Created by adityo.rancaka on 2023/05/10.
//

import SwiftUI
import UIKit

public struct ViewController<ViewController: UIViewController>: UIViewControllerRepresentable {

    public let viewController: ViewController

    public init(viewController: ViewController) {
        self.viewController = viewController
    }

    public func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {

    }
}

//
//  ViewController.swift
//  TheController
//
//  Created by Nikita Kuzmin on 15.11.2024.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - Properties
    
    private(set) lazy var customView = MainCustomView(delegate: self)
    
    // MARK: - Initialization
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - MainCustomViewDelegate

extension MainViewController: MainCustomViewDelegate {
    func handleButtonTap() {
        let controller = SecondaryViewController()
        controller.modalPresentationStyle = .popover
        controller.popoverPresentationController?.sourceView = customView.mainButton
        controller.popoverPresentationController?.permittedArrowDirections = .up
        controller.popoverPresentationController?.delegate = self
        present(controller, animated: true, completion: nil)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension MainViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) ->
    UIModalPresentationStyle {
        return .none
    }
    public func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false
    }
}

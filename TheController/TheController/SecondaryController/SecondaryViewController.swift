//
//  SecondaryViewController.swift
//  TheController
//
//  Created by Nikita Kuzmin on 15.11.2024.
//

import UIKit

final class SecondaryViewController: UIViewController {
    // MARK: - Constants
    
    private enum Constants {
        static let initialContentSize: CGSize = CGSize(width: 300, height: 300)
        static let heightCompact: Double = 150
        static let animateDuration: TimeInterval = 0.45
    }
    
    // MARK: - Properties
    
    private(set) lazy var customView = SecondaryCustomView(delegate: self)
    
    // MARK: - Initialization
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - SecondaryCustomViewDelegate

extension SecondaryViewController: SecondaryCustomViewDelegate {
    func handleCloseButtonTapped() {
        dismiss(animated: true)
    }
    
    func handleHeightAdjustment(isCompact: Bool) {
        let targetHeight = isCompact ? Constants.heightCompact : Constants.initialContentSize.height
        UIView.animate(withDuration: Constants.animateDuration) {
            self.preferredContentSize.height = targetHeight
        }
    }
}

// MARK: - Private

private extension SecondaryViewController {
    func initialSetup() {
        preferredContentSize = Constants.initialContentSize
    }
}

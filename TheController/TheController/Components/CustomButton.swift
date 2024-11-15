//
//  CustomButton.swift
//  TheController
//
//  Created by Nikita Kuzmin on 15.11.2024.
//

import UIKit

final class CustomButton: UIButton {
    
    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        setTitleColor(.systemBlue, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        switch tintAdjustmentMode {
        case.dimmed:
            setTitleColor(.systemGray4, for: .normal)
        default:
            setTitleColor(.systemBlue, for: .normal)
        }
    }
}

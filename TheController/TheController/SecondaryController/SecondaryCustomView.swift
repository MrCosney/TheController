//
//  SecondaryCustomView.swift
//  TheController
//
//  Created by Nikita Kuzmin on 15.11.2024.
//

import UIKit

protocol SecondaryCustomViewDelegate: AnyObject {
    func handleCloseButtonTapped()
    func handleHeightAdjustment(isCompact: Bool)
}

final class SecondaryCustomView: UIView {
    // MARK: - Properties
    
    private let delegate: SecondaryCustomViewDelegate?
    
    // MARK: - Properties
    
    private lazy var buttonClose: UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["280pt", "150pt"])
        view.addTarget(self, action: #selector(selectSegment), for: .valueChanged)
        view.backgroundColor = .systemGray6
        view.selectedSegmentIndex = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: -  Initialization
    
    init(delegate: SecondaryCustomViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension SecondaryCustomView {
    func addSubviews() {
        addSubview(buttonClose)
        addSubview(segmentedControl)
    }

    func makeConstraints() {
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            buttonClose.topAnchor.constraint(equalTo: segmentedControl.topAnchor),
            buttonClose.bottomAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            buttonClose.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func closeButtonTapped() {
        delegate?.handleCloseButtonTapped()
    }
    
    @objc
    private func selectSegment(_ segment: UISegmentedControl) {
        delegate?.handleHeightAdjustment(isCompact: segment.selectedSegmentIndex == 1)
    }
}

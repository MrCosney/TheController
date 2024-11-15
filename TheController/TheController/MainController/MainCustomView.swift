//
//  MainCustomView.swift
//  TheController
//
//  Created by Nikita Kuzmin on 15.11.2024.
//

import UIKit

protocol MainCustomViewDelegate: AnyObject {
    func handleButtonTap()
}

final class MainCustomView: UIView {
    // MARK: - Properties
    
    private let delegate: MainCustomViewDelegate?
    
    private(set) lazy var mainButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private(set) lazy var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Kit"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    // MARK: -  Initialization
    
    init(delegate: MainCustomViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lyfecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
    }
}

// MARK: - Private

private extension MainCustomView {
    func addSubviews() {
        addSubview(mainButton)
        addSubview(imageView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    // MARK: - Actions
    
    @objc
    func buttonTapped() {
        delegate?.handleButtonTap()
    }
}

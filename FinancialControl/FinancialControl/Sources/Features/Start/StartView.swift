//
//  StartView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import SharpnezDesignSystemUIKit
import SnapKit

protocol StartViewProtocol: UIView {
}

final class StartView: UISHContainerView, StartViewProtocol {
    
    // MARK: UI elements
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.Images.background))
        imageView.contentMode = .scaleAspectFill
        imageView.isAccessibilityElement = false
        return imageView
    }()
    
    private lazy var titleLabel: UISHLabel = {
        return UISHLabel(
            text: Localizable.Start.title,
            textColor: .onBackgroundSH,
            font: .title2(.poppins, .medium)
        )
    }()
    
    private lazy var createAccountButton: UISHButton = {
        return UISHButton(
            style: .primary(.primarySH, .onPrimarySH),
            title: Localizable.Start.createAccount,
            font: .montserrat
        )
    }()
    
    private lazy var loginButton: UISHButton = {
        return UISHButton(
            style: .secondary(.onBackgroundSH),
            title: Localizable.Start.login,
            font: .montserrat
        )
    }()
    
    // MARK: Init
    
    override init() {
        super.init()
        setup()
    }

    @available(*, unavailable)
    @MainActor required init?(coder: NSCoder) { nil }
}

extension StartView: ViewCode {
    
    // MARK: View Code
    
    func setupView() {
        scrollView.backgroundColor = .clear
    }
    
    func setupHierarchy() {
        insertSubview(backgroundImageView, at: .zero)
        scrollView.addSubviews(titleLabel, createAccountButton, loginButton)
    }
    
    func setupConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        createAccountButton.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(titleLabel.snp.bottom).offset(CGFloat.small)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(CGFloat.small)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(createAccountButton.snp.bottom).offset(CGFloat.small)
            $0.leading.trailing.bottom.equalTo(safeAreaLayoutGuide).inset(CGFloat.small)
        }
    }
}

//
//  CreateAccountView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import SharpnezCore
import SharpnezDesignSystemUIKit
import SnapKit

protocol CreateAccountViewProtocol: UIView {
    var buttonAction: (() -> Void)? { get set }
}

final class CreateAccountView: UISHContainerView, CreateAccountViewProtocol {
    
    // MARK: Properties
    
    var buttonAction: (() -> Void)?
    
    private var emailRule = UISHListItemViewModel(
        title: LoginLocalizable.CreateAccount.emailRule,
        isComplete: false
    )
    
    private var numberCharactersRule = UISHListItemViewModel(
        title: LoginLocalizable.CreateAccount.numberCharactersRule,
        isComplete: false
    )
    
    private var capitalLetterRule = UISHListItemViewModel(
        title: LoginLocalizable.CreateAccount.capitalLetterRule,
        isComplete: false
    )
    
    private var lowercaseLetterRule = UISHListItemViewModel(
        title: LoginLocalizable.CreateAccount.lowercaseLetterRule,
        isComplete: false
    )
    
    private var numberRule = UISHListItemViewModel(
        title: LoginLocalizable.CreateAccount.numberRule,
        isComplete: false
    )
    
    private var specialCharacterRule = UISHListItemViewModel(
        title: LoginLocalizable.CreateAccount.specialCharacterRule,
        isComplete: false
    )
    
    private var confirmPasswordRule = UISHListItemViewModel(
        title: LoginLocalizable.CreateAccount.confirmPasswordRule,
        isComplete: false
    )
    
    // MARK: UI elements
    
    public lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    public lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = .small
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = .init(
            top: .small,
            left: .small,
            bottom: .small,
            right: .small
        )
        return view
    }()
    
    private lazy var nameField: UISHTextField = UISHTextField(
        title: LoginLocalizable.Commons.name,
        font: .montserrat,
        color: .onBackgroundSH
    )
    
    private lazy var emailField: UISHTextField = {
        let field = UISHTextField(
            title: LoginLocalizable.Commons.email,
            font: .montserrat,
            color: .onBackgroundSH,
            listItems: [emailRule]
        )
        field.contentType = .emailAddress
        field.keyboardType = .emailAddress
        return field
    }()
    
    private lazy var passwordField: UISHPasswordField = UISHPasswordField(
        title: LoginLocalizable.Commons.password,
        font: .montserrat,
        color: .onBackgroundSH,
        listItems: [
            numberCharactersRule,
            capitalLetterRule,
            lowercaseLetterRule,
            numberRule,
            specialCharacterRule
        ]
    )
    
    private lazy var confirmPasswordField: UISHPasswordField = UISHPasswordField(
        title: LoginLocalizable.Commons.confirmPassword,
        font: .montserrat,
        color: .onBackgroundSH,
        listItems: [confirmPasswordRule]
    )
    
    private lazy var createAccountButton: UISHButton = {
        let button = UISHButton(
            style: .primary(.primarySH, .onPrimarySH),
            title: LoginLocalizable.CreateAccount.title,
            font: .montserrat
        )
        button.isDisabled = true
        return button
    }()
    
    // MARK: Init
    
    override init() {
        super.init()
        setup()
    }

    @available(*, unavailable)
    @MainActor required init?(coder: NSCoder) { nil }
}

extension CreateAccountView: ViewCode {
    
    // MARK: View Code

    func setupHierarchy() {
        addSubviews(scrollView, createAccountButton)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubviews(nameField, emailField, passwordField, confirmPasswordField)
    }

    func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(snp.width)
        }
        
        createAccountButton.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom).offset(CGFloat.medium)
            $0.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(CGFloat.small)
        }
    }
    
    // MARK: Actions
    
    func setupActions() {
        emailField.onChange = { [weak self] textField in
            guard let self else { return }
            self.emailRule.isComplete = textField.text?.isValidEmail
            self.emailField.updateListItems([self.emailRule])
            self.validateButton()
        }
        
        passwordField.onChange = { [weak self] textField in
            guard let self else { return }
            self.numberCharactersRule.isComplete = (textField.text?.count ?? .zero) > 7
            self.capitalLetterRule.isComplete = textField.text?.containsUppercasedLetter
            self.lowercaseLetterRule.isComplete = textField.text?.containsLowercasedLetter
            self.numberRule.isComplete = textField.text?.containsNumber
            self.specialCharacterRule.isComplete = textField.text?.containsSpecialCharacter
            self.passwordField.updateListItems([
                numberCharactersRule,
                capitalLetterRule,
                lowercaseLetterRule,
                numberRule,
                specialCharacterRule
            ])
            self.validateConfirmPasswordRule()
            self.validateButton()
        }
        
        confirmPasswordField.onChange = { [weak self] _ in
            guard let self else { return }
            self.validateConfirmPasswordRule()
            self.validateButton()
        }
        
        createAccountButton.action = { [weak self] in
            self?.buttonAction?()
        }
    }
    
    private func validateConfirmPasswordRule() {
        guard let text = confirmPasswordField.text else { return }
        
        confirmPasswordRule.isComplete = text == passwordField.text && !text.isEmpty
        confirmPasswordField.updateListItems([confirmPasswordRule])
    }
    
    private func validateButton() {
        let nameText = nameField.text ?? String()
        let allRulesValidated = [
            emailRule,
            numberCharactersRule,
            capitalLetterRule,
            lowercaseLetterRule,
            numberRule,
            specialCharacterRule,
            numberCharactersRule,
            confirmPasswordRule
        ].allSatisfy { $0.isComplete ?? false } && !nameText.isEmpty
        
        createAccountButton.isDisabled = !allRulesValidated
    }
}

extension CreateAccountView: UIScrollViewDelegate {
    
    // MARK: UIScrollViewDelegate
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != .zero {
            scrollView.contentOffset.x = .zero
        }
    }
}

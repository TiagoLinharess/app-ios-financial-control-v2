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
}

final class CreateAccountView: UISHContainerView, CreateAccountViewProtocol {
    
    // MARK: Properties
    
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
    
    private lazy var createAccountButton: UISHButton = UISHButton(
        style: .primary(.primarySH, .onPrimarySH),
        title: LoginLocalizable.CreateAccount.title,
        font: .montserrat
    )
    
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
    
    func setupView() { }

    func setupHierarchy() {
        contentView.addSubviews(
            nameField,
            emailField,
            passwordField,
            confirmPasswordField,
            createAccountButton
        )
    }

    func setupConstraints() {
        nameField.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview().inset(CGFloat.small)
        }
        
        emailField.snp.makeConstraints {
            $0.top.equalTo(nameField.snp.bottom).offset(CGFloat.small)
            $0.horizontalEdges.equalToSuperview().inset(CGFloat.small)
        }
        
        passwordField.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(CGFloat.small)
            $0.horizontalEdges.equalToSuperview().inset(CGFloat.small)
        }
        
        confirmPasswordField.snp.makeConstraints {
            $0.top.equalTo(passwordField.snp.bottom).offset(CGFloat.small)
            $0.horizontalEdges.equalToSuperview().inset(CGFloat.small)
        }
        
        createAccountButton.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(confirmPasswordField.snp.bottom).offset(CGFloat.medium)
            $0.bottom.horizontalEdges.equalToSuperview().inset(CGFloat.small)
        }
    }
    
    // MARK: Actions
    
    func setupActions() {
        emailField.onChange = { [weak self] textField in
            guard let self else { return }
            self.emailRule.isComplete = textField.text?.isValidEmail
            self.emailField.updateListItems([self.emailRule])
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
        }
        
        confirmPasswordField.onChange = { [weak self] _ in
            guard let self else { return }
            self.validateConfirmPasswordRule()
        }
    }
    
    private func validateConfirmPasswordRule() {
        guard let text = confirmPasswordField.text else { return }
        
        confirmPasswordRule.isComplete = text == passwordField.text && !text.isEmpty
        confirmPasswordField.updateListItems([confirmPasswordRule])
    }
}

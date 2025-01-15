//
//  CreateAccountView.swift
//  FinancialControl
//
//  Created by Tiago Linhares on 05/01/25.
//

import IQKeyboardToolbar
import SharpnezCore
import SharpnezDesignSystemUIKit
import SnapKit

protocol CreateAccountViewProtocol: UIView {
    var buttonAction: ((CreateAccountModel) -> Void)? { get set }
}

final class CreateAccountView: UISHContainerView, CreateAccountViewProtocol {
    
    // MARK: Properties
    
    var buttonAction: ((CreateAccountModel) -> Void)?
    
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
    
    private lazy var familyNameField: UISHTextField = UISHTextField(
        title: LoginLocalizable.Commons.familyName,
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
        field.autocapitalizationType = .none
        return field
    }()
    
    private lazy var passwordField: UISHPasswordField = {
        let field = UISHPasswordField(
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
        field.autocapitalizationType = .none
        return field
    }()
    
    private lazy var confirmPasswordField: UISHPasswordField = {
        let field = UISHPasswordField(
            title: LoginLocalizable.Commons.confirmPassword,
            font: .montserrat,
            color: .onBackgroundSH,
            listItems: [confirmPasswordRule]
        )
        field.autocapitalizationType = .none
        return field
    }()
    
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
        stackView.addArrangedSubviews(
            nameField,
            familyNameField,
            emailField,
            passwordField,
            confirmPasswordField
        )
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
        nameField.onChange = { [weak self] _ in
            self?.validateButton()
        }
        
        familyNameField.onChange = { [weak self] _ in
            self?.validateButton()
        }
        
        emailField.onChange = { [weak self] _ in
            self?.validateEmailRule()
        }
        
        passwordField.onChange = { [weak self] _ in
            self?.validatePasswordRule()
        }
        
        confirmPasswordField.onChange = { [weak self] _ in
            self?.validateConfirmPasswordRule()
        }
        
        createAccountButton.action = didTapCreateAccountButton
        setupFieldsToolbar()
    }
    
    private func validateEmailRule() {
        emailRule.isComplete = emailField.text?.isValidEmail
        emailField.updateListItems([self.emailRule])
        validateButton()
    }
    
    private func validatePasswordRule() {
        numberCharactersRule.isComplete = (passwordField.text?.count ?? .zero) > 7
        capitalLetterRule.isComplete = passwordField.text?.containsUppercasedLetter
        lowercaseLetterRule.isComplete = passwordField.text?.containsLowercasedLetter
        numberRule.isComplete = passwordField.text?.containsNumber
        specialCharacterRule.isComplete = passwordField.text?.containsSpecialCharacter
        passwordField.updateListItems([
            numberCharactersRule,
            capitalLetterRule,
            lowercaseLetterRule,
            numberRule,
            specialCharacterRule
        ])
        
        validateConfirmPasswordRule()
        validateButton()
    }
    
    private func validateConfirmPasswordRule() {
        guard let text = confirmPasswordField.text else { return }
        
        confirmPasswordRule.isComplete = text == passwordField.text && !text.isEmpty
        confirmPasswordField.updateListItems([confirmPasswordRule])
        validateButton()
    }
    
    private func validateButton() {
        let nameText = nameField.text ?? String()
        let familyNameText = familyNameField.text ?? String()
        let allRulesValidated = [
            emailRule,
            numberCharactersRule,
            capitalLetterRule,
            lowercaseLetterRule,
            numberRule,
            specialCharacterRule,
            numberCharactersRule,
            confirmPasswordRule
        ].allSatisfy { $0.isComplete ?? false } && !nameText.isEmpty && !familyNameText.isEmpty
        
        createAccountButton.isDisabled = !allRulesValidated
    }
    
    private func didTapCreateAccountButton() {
        guard let name = nameField.text,
              let familyName = familyNameField.text,
              let email = emailField.text,
              let password = passwordField.text
        else { return }
        
        let model = CreateAccountModel(
            name: name,
            familyName: familyName,
            email: email,
            password: password
        )
        buttonAction?(model)
    }
}

private extension CreateAccountView {
    
    // MARK: Textfields toolbar actions
    
    private func setupFieldsToolbar() {
        nameField.textField.iq.addPreviousNextDone(
            target: self,
            previousAction: #selector(doneAction),
            nextAction: #selector(focusFamilyNameField),
            doneAction: #selector(doneAction)
        )
        familyNameField.textField.iq.addPreviousNextDone(
            target: self,
            previousAction: #selector(focusNameField),
            nextAction: #selector(focusEmailField),
            doneAction: #selector(doneAction)
        )
        emailField.textField.iq.addPreviousNextDone(
            target: self,
            previousAction: #selector(focusFamilyNameField),
            nextAction: #selector(focusPasswordField),
            doneAction: #selector(doneAction)
        )
        passwordField.getTextField().iq.addPreviousNextDone(
            target: self,
            previousAction: #selector(focusEmailField),
            nextAction: #selector(focusConfirmPasswordField),
            doneAction: #selector(doneAction)
        )
        confirmPasswordField.getTextField().iq.addPreviousNextDone(
            target: self,
            previousAction: #selector(focusPasswordField),
            nextAction: #selector(doneAction),
            doneAction: #selector(doneAction)
        )
    }
    
    @objc
    func doneAction() {
        endEditing(true)
    }
    
    @objc
    func focusNameField() {
        nameField.textField.becomeFirstResponder()
    }
    
    @objc
    func focusFamilyNameField() {
        familyNameField.textField.becomeFirstResponder()
    }
    
    @objc
    func focusEmailField() {
        emailField.textField.becomeFirstResponder()
    }
    
    @objc
    func focusPasswordField() {
        passwordField.getTextField().becomeFirstResponder()
    }
    
    @objc
    func focusConfirmPasswordField() {
        confirmPasswordField.getTextField().becomeFirstResponder()
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

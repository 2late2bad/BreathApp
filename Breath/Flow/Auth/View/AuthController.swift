//
//  AuthController.swift
//  Breath
//
//  Created by Alexander V. on 17.09.2023.
//

import UIKit
import UIComponents
import Combine

// MARK: - AuthController
final class AuthController: UIViewController, FlowController {

    var completionHandler: ((Bool) -> Void)?

    // MARK: - Properties
    private let viewModel: AuthViewModel
    var cancellables = Set<AnyCancellable>()

    // MARK: - Views
    private let logotip: AuthLogoView
    private let mainLabel: BALabel
    private let loginTextField: BATextField
    private let passwordTextField: BATextField
    private let repeatPasswordTextField: BATextField
    private let enterButton: BAPrimaryButton
    private let switchView: AuthSwitchView
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = UIScreen.getHeight * 0.02
        return stack
    }()

    // MARK: - Init
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel

        logotip = AuthLogoView()
        mainLabel = BALabel(text: viewModel.isAuth ? "Авторизация" : "Регистрация",
                            font: R.font.montBlancTrialBold(size: 22),
                            color: R.color.authText(),
                            align: .center)
        loginTextField = BATextField(placeholder: "Email", type: .email)
        passwordTextField = BATextField(placeholder: "Пароль", type: .password)
        repeatPasswordTextField = BATextField(placeholder: "Повторите пароль", type: .password)
        enterButton = BAPrimaryButton(title: "Войти", height: 40)
        switchView = AuthSwitchView(isAuth: viewModel.isAuth)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutUI()
        addTextFieldPublishers()
        addInteractivePublishers()
        enterButtonPressed()
        switchButtonPressed()
    }

    // MARK: - Publishers
    func addTextFieldPublishers() {
        loginTextField.textPublisher
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellables)

        passwordTextField.textPublisher
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellables)

        repeatPasswordTextField.textPublisher
            .assign(to: \.repeatPass, on: viewModel)
            .store(in: &cancellables)
    }

    func addInteractivePublishers() {
        viewModel.$isAuth
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                guard let self else { return }
                if status {
                    self.mainLabel.text = "Авторизация"
                    self.stackView.removeArrangedSubview(repeatPasswordTextField)
                    self.repeatPasswordTextField.removeFromSuperview()
                    self.repeatPasswordTextField.isHidden = true
                    self.enterButton.setTitle("Войти", for: .normal)
                } else {
                    self.mainLabel.text = "Регистрация"
                    self.stackView.addArrangedSubview(repeatPasswordTextField)
                    self.repeatPasswordTextField.isHidden = false
                    self.enterButton.setTitle("Зарегистрироваться", for: .normal)
                }
            }
            .store(in: &cancellables)

        viewModel.isSumbitEnabled
            .receive(on: DispatchQueue.main)
            .sink { [weak self] unlock in
                guard let self else { return }
                if unlock {
                    enterButton.isEnabled = true
                    enterButton.alpha = 1
                    enterButton.backgroundColor = .green
                } else {
                    enterButton.isEnabled = false
                    enterButton.alpha = 0.7
                    enterButton.backgroundColor = .gray
                }
            }
            .store(in: &cancellables)

        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                switch state {
                case .loading:
                    break
                case .success:
                    self?.completionHandler?(true)
                case .failed(let error):
                    print(">DEBUG<", error)
                case .none: break
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - Private methods
private extension AuthController {

    private func setupView() {
        view.backgroundColor = .white // todo
        view.addSubviews(
            logotip, stackView, enterButton, switchView
        )
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        if !viewModel.isAuth {
            stackView.addArrangedSubview(repeatPasswordTextField)
        }

        loginTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }

    private func layoutUI() {
        logotip.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().inset(UIScreen.getHeight * 0.05)
            make.centerX.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(logotip.snp.bottom).offset(UIScreen.getHeight * 0.10)
            make.left.right.equalToSuperview().inset(40)
        }

        enterButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(UIScreen.getHeight * 0.02)
            make.left.right.equalToSuperview().inset(40)
        }

        switchView.snp.makeConstraints { make in
            make.bottomMargin.equalToSuperview().inset(30)
            make.left.right.equalToSuperview().inset(UIScreen.getWidth * 0.25)
        }
    }

    private func enterButtonPressed() {
        enterButton.callback = { [weak self] in
            guard let self else { return }
            Task {
                await self.viewModel.submitLogin()
            }
        }
    }

    private func switchButtonPressed() {
        switchView.callback = { [weak self] status in
            guard let self else { return }
            self.viewModel.isAuth = status
        }
    }
}

// MARK: - UITextFieldDelegate
extension AuthController: UITextFieldDelegate {

    public func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case passwordTextField:
            guard let text = passwordTextField.text else { return }
            passwordTextField.eyeButton.isEnabled = !text.isEmpty
        case repeatPasswordTextField:
            guard let text = repeatPasswordTextField.text else { return }
            repeatPasswordTextField.eyeButton.isEnabled = !text.isEmpty
        default: break
        }
    }
}

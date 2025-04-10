import UIKit

class LogInViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .clear
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = .systemBlue
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .clear
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = .systemBlue
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailTextField, dividerView, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])

        return view
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false

        if let bgImage = UIImage(named: "blue_pixel") {
            button.setBackgroundImage(bgImage, for: .normal)
            button.setBackgroundImage(bgImage.withAlpha(0.8), for: .highlighted)
            button.setBackgroundImage(bgImage.withAlpha(0.8), for: .selected)
            button.setBackgroundImage(bgImage.withAlpha(0.8), for: .disabled)
        }

        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true

        setupScrollView()
        setupLayout()
        setupKeyboardObservers()
        hideKeyboardWhenTappedAround()
    }

    @objc private func logInButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupLayout() {
        [logoImageView, containerView, logInButton].forEach {
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            containerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 100),

            logInButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),

            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }

        scrollView.contentInset.bottom = keyboardFrame.height + 20
    }

    @objc private func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
    }

    private func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

private extension UIImage {
    func withAlpha(_ alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}

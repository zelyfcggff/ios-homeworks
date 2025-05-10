import UIKit

class InfoViewController: UIViewController {

    private let alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show alert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Info"

        setupAlertButton()

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(close)
        )
    }

    private func setupAlertButton() {
        view.addSubview(alertButton)

        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }

    @objc private func showAlert() {
        let alert = UIAlertController(
            title: "!Attention!",
            message: "Chose action",
            preferredStyle: .alert
        )

        let actionOne = UIAlertAction(title: "Blue", style: .default) { _ in
            print("Blue action pressed")
        }

        let actionTwo = UIAlertAction(title: "Red", style: .destructive) { _ in
            print("Red action pressed")
        }

        alert.addAction(actionOne)
        alert.addAction(actionTwo)

        present(alert, animated: true, completion: nil)
    }

    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}

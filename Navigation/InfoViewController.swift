import UIKit

class InfoViewController: UIViewController {

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
        let button = UIButton(type: .system)
        button.setTitle("Show alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func showAlert() {
        let alert = UIAlertController(
            title: "!ALERT!",
            message: "Chose action",
            preferredStyle: .alert
        )

        let actionOne = UIAlertAction(title: "Blue action", style: .default) { _ in
            print("Pressed: Blue action")
        }

        let actionTwo = UIAlertAction(title: "Red action", style: .destructive) { _ in
            print("Pressed: Red action")
        }

        alert.addAction(actionOne)
        alert.addAction(actionTwo)

        present(alert, animated: true, completion: nil)
    }

    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}

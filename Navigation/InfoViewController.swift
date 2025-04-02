import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Инфо"

        setupAlertButton()

        // Добавим кнопку "Закрыть" слева в навигации
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(close)
        )
    }

    private func setupAlertButton() {
        let button = UIButton(type: .system)
        button.setTitle("Показать алерт", for: .normal)
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
            title: "Внимание",
            message: "Выберите действие",
            preferredStyle: .alert
        )

        let actionOne = UIAlertAction(title: "Первое", style: .default) { _ in
            print("Нажато: Первое действие")
        }

        let actionTwo = UIAlertAction(title: "Второе", style: .destructive) { _ in
            print("Нажато: Второе действие")
        }

        alert.addAction(actionOne)
        alert.addAction(actionTwo)

        present(alert, animated: true, completion: nil)
    }

    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}

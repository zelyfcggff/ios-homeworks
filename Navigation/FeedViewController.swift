import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Лента"
        setupButton()
    }

    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Открыть пост", for: .normal)
        button.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func openPost() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
}

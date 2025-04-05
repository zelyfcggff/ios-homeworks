import UIKit

class FeedViewController: UIViewController {

    private let openPostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open post", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Feed"

        setupButton()
    }

    private func setupButton() {
        view.addSubview(openPostButton)
        
        NSLayoutConstraint.activate([
            openPostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openPostButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        openPostButton.addTarget(self, action: #selector(openPost), for: .touchUpInside)
    }

    @objc private func openPost() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
}

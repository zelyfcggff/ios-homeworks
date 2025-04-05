import UIKit

class PostViewController: UIViewController {

    var post: Post?

    private let infoButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Info",
            style: .plain,
            target: nil,
            action: nil
        )
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = post?.title
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        infoButton.target = self
        infoButton.action = #selector(openInfo)
        navigationItem.rightBarButtonItem = infoButton
    }

    @objc private func openInfo() {
        let infoVC = InfoViewController()
        let navVC = UINavigationController(rootViewController: infoVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

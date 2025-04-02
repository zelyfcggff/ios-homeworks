import UIKit

class PostViewController: UIViewController {

    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = post?.title
        setupInfoButton()
    }

    private func setupInfoButton() {
        let infoButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = infoButton
    }

    @objc private func openInfo() {
        let infoVC = InfoViewController()
        let navVC = UINavigationController(rootViewController: infoVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

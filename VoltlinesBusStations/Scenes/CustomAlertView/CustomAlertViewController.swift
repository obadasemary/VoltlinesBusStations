//
//  CustomAlertViewController.swift
//  VoltlinesBusStations
//
//  Created by Abdelrahman Mohamed on 14.07.2023.
//

import UIKit

enum AlertType {
    case success
    case failure
}

class CustomAlertViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    var alertTitle = ""
    var alertMessage = ""
    var actionButtonTitle = ""

    init() {
        super.init(nibName: "CustomAlertViewController", bundle: Bundle(for: CustomAlertViewController.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var onTap: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    func setupUI() {

        let blurFx = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurFxView = UIVisualEffectView(effect: blurFx)
        blurFxView.frame = view.bounds
        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurFxView, at: 0)

        alertView.layer.cornerRadius = 10
        titleLabel.textColor = .label
        titleLabel.font = .systemFont(ofSize: 20)
        messageLabel.textColor = .label
        messageLabel.font = .systemFont(ofSize: 20)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.backgroundColor = .blue
        actionButton.layer.cornerRadius = 20
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)

        self.titleLabel.text = alertTitle
        self.messageLabel.text = alertMessage
        actionButton.setTitle(actionButtonTitle, for: .normal)
    }

    func show() {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?
            .rootViewController?
            .present(
                self,
                animated: true
            )
    }

    @IBAction func onClickAction(_ sender: Any) {
        self.dismiss(animated: true)
        onTap?()
    }
}

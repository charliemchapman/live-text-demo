import UIKit

class MainViewController: UIViewController {
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        styleTextField(textField)
        textField.placeholder = "Name"
        
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        styleTextField(textField)
        textField.placeholder = "Email"
        
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        styleTextField(textField)
        textField.placeholder = "Phone Number"
        
        textField.keyboardType = .phonePad
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    lazy var websiteTextField: UITextField = {
        let textField = UITextField()
        styleTextField(textField)
        textField.placeholder = "Website"
        
        textField.keyboardType = .URL
        textField.autocorrectionType = .no
        
        return textField
    }()
    
    lazy var notesTextView: UITextView = {
        let textView = UITextView()
        styleTextView(textView)
        
        return textView
    }()
    
    private func configureCameraButton() {
        guard self.canPerformAction(#selector(captureTextFromCamera(_:)), withSender: self) else {
            return
        }
        
        let textFromCameraAction = UIAction.captureTextFromCamera(responder: self, identifier: nil)
        cameraButton = UIButton(type: .system, primaryAction: textFromCameraAction)
        
        scrollView.addSubview(cameraButton)
        constrainCameraButton()
    }
    
    
    private func styleTextField(_ textField: UITextField) {
        textField.backgroundColor = ThemeColors.beige
        textField.layer.cornerRadius = 3
    }
    
    private func styleTextView(_ textView: UITextView) {
        textView.backgroundColor = ThemeColors.beige
        textView.layer.cornerRadius = 3
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.keyboardDismissMode = .interactive
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    lazy var notesLabel: UILabel = {
        let label = UILabel()
        label.text = "Notes"
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = ThemeColors.white
        return label
    }()
    
    lazy var bigLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = ThemeColors.white
        label.numberOfLines = 0
        return label
    }()
    
    var cameraButton: UIButton!
    
    let verticalSpacing: CGFloat = 16
    let horizontalSpacing: CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact Info"
        view.backgroundColor = ThemeColors.lightGreen

        configureViews()
        constrainViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    private func configureViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(phoneTextField)
        scrollView.addSubview(websiteTextField)
        scrollView.addSubview(notesLabel)
        scrollView.addSubview(notesTextView)
        scrollView.addSubview(bigLabel)
        configureCameraButton()
    }
    
    private func constrainViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalSpacing),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalSpacing)
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: verticalSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalSpacing),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalSpacing)
        ])
        
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: verticalSpacing),
            phoneTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalSpacing),
            phoneTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalSpacing)
        ])
        
        websiteTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            websiteTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: verticalSpacing),
            websiteTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalSpacing),
            websiteTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalSpacing)
        ])
        
        notesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notesLabel.topAnchor.constraint(equalTo: websiteTextField.bottomAnchor, constant: verticalSpacing),
            notesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalSpacing),
            notesLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalSpacing)
        ])
        
        notesTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notesTextView.heightAnchor.constraint(equalToConstant: 100),
            notesTextView.topAnchor.constraint(equalTo: notesLabel.bottomAnchor, constant: 8),
            notesTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalSpacing),
            notesTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalSpacing)
        ])
        
        bigLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bigLabel.topAnchor.constraint(equalTo: cameraButton.bottomAnchor, constant: verticalSpacing),
            bigLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalSpacing),
            bigLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalSpacing),
            bigLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -verticalSpacing)
        ])
    }
    
    private func constrainCameraButton() {
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cameraButton.topAnchor.constraint(equalTo: notesTextView.bottomAnchor, constant: horizontalSpacing),
            cameraButton.leadingAnchor.constraint(equalTo: notesTextView.leadingAnchor),
        ])
    }
}







extension MainViewController: UIKeyInput {
    var hasText: Bool { false }
    
    func insertText(_ text: String) {
        bigLabel.text = text
    }
    
    func deleteBackward() { }
}

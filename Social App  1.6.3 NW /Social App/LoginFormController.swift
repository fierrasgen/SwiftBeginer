//
//  код из методички

import UIKit

class LoginFormController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
   
    
    @IBOutlet weak var loginInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBAction func loginButtomPressed(_ sender: Any) {
        let login = loginInput.text!
        let password = passwordInput.text!
        if login == "admin" && password == "123456" {
            print("успешная авторизация")
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabViewController") as! TabViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            
        } else {
            print("неуспешная авторизация")
            
            let alert = UIAlertController(title: "Ошибка", message: "Неуспешная авторизация! Проверьте логин и пароль", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ок", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    @objc func keyboardWasShown(notification: Notification) {
        
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    @objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }


}

   


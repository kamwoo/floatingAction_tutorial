//
//  ViewController.swift
//  floatingAction_tutorial
//
//  Created by wooyeong kam on 2021/06/08.
//

import UIKit
import JJFloatingActionButton
import SwiftUI

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionButton = JJFloatingActionButton()
        
        actionButton.buttonColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)

        actionButton.addItem(title: "좋아요", image: UIImage(systemName: "hand.thumbsup.fill")?.withRenderingMode(.alwaysTemplate)) { item in
            self.titleLabel.text = "좋아요👍🏻"
        }

        actionButton.addItem(title: "친구 찾기", image: UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysTemplate)) { item in
            self.titleLabel.text = "친구 찾기"
        }

        actionButton.addItem(title: "마음에 들어요", image: UIImage(systemName: "heart.fill")) { item in
            self.titleLabel.text = "조하여😃"
        }
        
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        
        let secondActionButton = JJFloatingActionButton()

        secondActionButton.addItem(title: "", image: nil) { item in
            
            let alertController = UIAlertController(title: "수정", message: "작성해주세요", preferredStyle: .alert)
            alertController.addTextField()
            
            let submitButton = UIAlertAction(title: "완료", style: .default){ action in
                let textField = alertController.textFields![0]
                
                guard let userInput = textField.text else {
                    print("no value")
                    return
                }
                
                self.titleLabel.text = userInput
            }
            
            alertController.addAction(submitButton)
            self.present(alertController, animated: true, completion: nil)
        }
        
        view.addSubview(secondActionButton)
        secondActionButton.translatesAutoresizingMaskIntoConstraints = false
        secondActionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        secondActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
    }


}

#if DEBUG
struct ViewContorollerRepresentable : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
    
}

struct ViewController_Previews : PreviewProvider {
    static var previews: some View{
        ViewContorollerRepresentable()
    }
}

#endif


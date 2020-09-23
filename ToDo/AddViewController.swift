//
//  AddViewController.swift
//  ToDo
//
//  Created by 高山瑞基 on 2020/09/23.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var toDoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        //配列に追加
        toDoList.append(toDoTextField.text!)
        
        //追加ボタンを押したらテキストを空にする
        toDoTextField.text = ""
        
        //変数の中身をUDに追加
        UserDefaults.standard.set(toDoList, forKey: "TodoList")
        
        //Navigation Controllerを取得
        let nav = self.presentingViewController  as! UINavigationController

        // 親VCを取り出し
        let firstVC = nav.viewControllers[nav.viewControllers.count-1] as! ViewController
        
        firstVC.table.reloadData()

        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

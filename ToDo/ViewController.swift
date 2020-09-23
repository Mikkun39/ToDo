//
//  ViewController.swift
//  ToDo
//
//  Created by 高山瑞基 on 2020/09/23.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var saveData: UserDefaults = UserDefaults.standard
    
    //ストーリーボード上で扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            toDoList = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }
    
    /// 画面再表示
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            toDoList = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return toDoList.count
    }

    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //変数の中身を作る
        TodoCell.textLabel!.text = toDoList[indexPath.row]
       
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
    //スワイプしたセルを削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            UserDefaults.standard.removeObject(forKey: "TodoList")
            UserDefaults.standard.set(toDoList, forKey: "TodoList" )
        }
    }

}


//
//  ViewController.swift
//  UITextViewDemo
//
//  Created by Trista on 2021/2/11.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    //取得螢幕的尺寸
    let fullScreenSize = UIScreen.main.bounds.size
    
    //為ViewController建立UITextView和myTextField屬性，因應後續的使用
    var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //建立 UITextView，使用屬性myTextView來生成
        //使用 UITextView(frame:) 建立一個 UITextView
        myTextView = UITextView(
          frame: CGRect(x: 0, y: 0, width: 250, height: 200))
        
        //設置於畫面的中間偏上位置
        myTextView.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.3)
        
        //背景顏色
        myTextView.backgroundColor = UIColor.darkGray

        //文字顏色
        myTextView.textColor = UIColor.white

        //文字字型及大小
        myTextView.font = UIFont(name: "Helvetica-Light", size: 20)

        //文字向左對齊
        myTextView.textAlignment = .left

        //預設文字內容
        myTextView.text = "TextView上請輸入文字"

        //適用的鍵盤樣式 選擇預設的
        myTextView.keyboardType = .default

        //鍵盤上的 return 鍵樣式 ,選擇預設的
        myTextView.returnKeyType = .default
        
        //文字是否可以被編輯
        myTextView.isEditable = true

        //文字是否可以被選取
        myTextView.isSelectable = true

        //交付委任對象的方式，就是要設置delegate屬性
        myTextView.delegate = self
        
        //加入畫面
        self.view.addSubview(myTextView)
        
        
        //按輸入框之外其他空白處的方式來隱藏鍵盤
        //增加一個觸控事件
        let tap = UITapGestureRecognizer(
          target: self,
          action: #selector(ViewController.hideKeyboard))

        tap.cancelsTouchesInView = false

        //加在最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
        
    }

    
    //為不同輸入框元件設置不同的選取內容後的選單，可以將建立選單的程式，改放到元件取得焦點時的方法。以UITextView來說，就可以寫在textViewDidBeginEditing(textView: UITextView)這個委任函式中
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        //在選取文字後，對這段文字進行操作，像是全選、複製、貼上等等。除此之外還可以自己增加需要的功能選項
        //自訂選取內容後的選項
        //建立兩個新的選項
        let mail = UIMenuItem(
          title: "寄送",
          action: #selector(ViewController.sendMail))
        
        let facebook = UIMenuItem(
          title: "FB",
          action: #selector(ViewController.sendFB))

        //建立選單
        let menu = UIMenuController.shared

        //將新的選項加入選單
        menu.menuItems = [mail,facebook]
        
    }
    
    /*
    //dismissing the keyboard when click return/done key on UITextView
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    */
    
    @objc func sendMail() {
        print("sendMail")
    }

    @objc func sendFB() {
        print("sendFB")
    }
    
    
    @objc func hideKeyboard(tapG:UITapGestureRecognizer){
        //UITextField 按下return按鈕時結束編輯,把鍵盤隱藏起來,使用 self.view.endEditing(true)
        //也可按輸入框之外其他空白處的方式來隱藏鍵盤,使用 resignFirstResponder()
        //來針對一個元件隱藏鍵盤
        self.myTextView.resignFirstResponder()
    }
    /*
    //載入畫面時，讓游標自動出現在第一個UITextView，並跳出鍵盤
    override func viewWillAppear(_ animated: Bool) {
        self.myTextView.becomeFirstResponder()
    }
    */
}


//
//  QuestionViewController.swift
//  PsychTestAPP
//
//  Created by 廖晨如 on 2022/12/17.
//

import UIKit

class QuestionViewController: UIViewController {

    struct Qna{
        var question: String
        var option: [String]
    }
    var questions = [Qna]()
    var index = 0
    var score = 0
    let maxQuestionNumber = 10
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 填入所有問題
        var question = Qna(question: "1. 如果朋友生病住院，你探望時覺得送下面哪種花最適合？", option: ["白色百合花","紫色鬱金香","黃色玫瑰花"])
        questions.append(question)
        question = Qna(question: "2. 和父母爭吵過後，你會主動道歉？", option: ["不是","不確定","是的"])
        questions.append(question)
        question = Qna(question: "3. 給臥室裝窗簾，你會選擇下列哪種顏色的窗簾？", option: ["粉色","淺藍色","米白色"])
        questions.append(question)
        question = Qna(question: "4. 你的知心好友有多少個？", option: ["0 個","1~3 個"," 3 個以上"])
        questions.append(question)
        question = Qna(question: "5. 以下幾種小動物，你最喜歡的是？", option: ["金魚","波斯貓","鸚鵡"])
        questions.append(question)
        question = Qna(question: "6. 坐在火車上，有陌生人來搭訕，你會？", option: ["冷漠以對，隨口應付","不確定","微笑面對，熱心回答"])
        questions.append(question)
        question = Qna(question: "7. 你獨自到郊外旅遊，突然迷路了，你會？", option: ["報警","向附近村民求救，請求幫忙","向路人詢問出路"])
        questions.append(question)
        question = Qna(question: "8. 如果家裡只剩下三種吃的東西，飢餓時你會選擇哪一個？", option: ["饅頭","漢堡","牛肉拉麵"])
        questions.append(question)
        question = Qna(question: "9. 你燒得一手好菜？", option: ["是的","不確定","不是"])
        questions.append(question)
        question = Qna(question: "10. 如果有朋友，凌晨一點左右，打電話找你聊天，你會？", option: ["關機","接電話，坦白說自己想睡覺","陪他聊天，想睡時再告訴對方"])
        questions.append(question)
        //更新 QA
        updateQna(index)
    }
    
    
    func updateQna(_ index: Int){
        questionLabel.text = questions[index].question
        optionOne.setTitle(questions[index].option[0], for: .normal)
        optionTwo.setTitle(questions[index].option[1], for: .normal)
        optionThree.setTitle(questions[index].option[2], for: .normal)
        self.index += 1
    }
    
    //點擊選項
    @IBAction func calculateScore(_ sender: UIButton) {
        if(index < maxQuestionNumber){
            //計算分數 optionOne: + 1;optionTwo: +2;optionThree: +3 => 直接加 tag
            score += sender.tag
//            print("\(sender.tag): \(score)")
            //更新 QA
            updateQna(index)
        }else{
            //跳下一頁
            score += sender.tag//第十題
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
    //傳遞分數
    @IBSegueAction func displayResult(_ coder: NSCoder) -> ResultViewController? {
        return ResultViewController(coder: coder, resultScore: score)
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

//
//  ResultViewController.swift
//  PsychTestAPP
//
//  Created by 廖晨如 on 2022/12/17.
//

import UIKit

class ResultViewController: UIViewController {
    
    struct testResult{
        var level: String
        var description: String
    }
    var results = [testResult]()
    
    //接收上一頁傳過來的分數
    let resultScore: Int
    init?(coder: NSCoder, resultScore: Int) {
        self.resultScore = resultScore
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //輸入所有結果
        var result = testResult(level: "宅人等級: ⭐⭐⭐⭐⭐", description: "你是個缺乏安全感的人，不喜歡把自己的故事和別人一起分享，許多心事只願放在心裡，不願意與人交流，喜歡享受獨處的感覺。家是你唯一感到溫暖和安全的地方，在這個狹小的空間裡，你可以放鬆心情，為所欲為。宅在家裡，你喜歡上網，購物，讀書，沉浸在自己的世界裡，對外界不聞不問，你的「宅」功可謂是相當了得。")
        results.append(result)
        result = testResult(level: "宅人等級: ⭐⭐⭐⭐", description: "從小養尊處優、得到父母寵愛的你，不需要為了錢財而忙碌，到處奔波。因此，「宅」似乎就變成了你的一種習慣。由於家庭對你的保護過度，造成你與社會接觸得較少，使得你的溝通能力較弱，也不善於處理人際關係方面的問題。對你而言，只有家人才沒有陌生的感覺，其他人都很難走進你的內心，獲得你的信任。")
        results.append(result)
        result = testResult(level: "宅人等級: ⭐⭐⭐", description: "你是個有理想、有抱負的人，有著美好的願望，對未來也有許多期許。只是，工作方面的小不如意，讓你的心情稍稍有些失落。但是，你宅在家裡，只是希望有個人的自由空間，做一些自己想做的事情，你很少在家玩樂，而是不斷地給自己的充電，學習一些新的技能，提高自己的能力和素質。因此，你屬於宅得比較充實的一類人。")
        results.append(result)
        result = testResult(level: "宅人等級: ⭐⭐", description: "生活中遇到了不少挫折，讓你變得有些悲觀，對自己缺乏信心，對社會也有些排斥。你不想和任何人接觸，也不想別人來打擾你。宅在家裡，你不用再帶著面具做人，想幹什麼就幹什麼，沒有絲毫的壓力。你不過是階段性的宅人，等你恢復了自信，就會變得活潑、開朗了。")
        results.append(result)
        updateResult()
//        print(resultScore)
    }
    
    func updateResult(){
        if(resultScore <= 17){
            levelLabel.text = results[0].level
            descriptionTextView.text = results[0].description
        }else if(resultScore <= 20 ){
            levelLabel.text = results[1].level
            descriptionTextView.text = results[1].description
        }else if(resultScore <= 23 ){
            levelLabel.text = results[2].level
            descriptionTextView.text = results[2].description
        }else if(resultScore <= 30 ){
            levelLabel.text = results[3].level
            descriptionTextView.text = results[3].description
        }
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

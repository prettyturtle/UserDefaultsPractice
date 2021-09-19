import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView: UIImageView!
    var dice: Dice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.dice = self.getDataFromUserDefaults()

        print("----------------------------------------")
        print(getDataFromUserDefaults())
        print("----------------------------------------")
    }
    
    func getDataFromUserDefaults() -> Dice {
        guard let data = UserDefaults.standard.value(forKey: "dice") as? Data,
              let getDiceDetail = try? PropertyListDecoder().decode(Dice.self, from: data) else { return Dice(totalCount: 0, detailCount: [0, 0, 0, 0, 0, 0, 0]) }
        
        return getDiceDetail
    }
    
    @IBAction func tapRollDice(_ sender: UIButton) {
        
        self.dice?.totalCount += 1
        
        let randomNumber = Int.random(in: 1...6)

        switch randomNumber {
        case 1:
            self.dice?.detailCount[1] += 1
            print(randomNumber, "이 나왔습니다")
            self.diceImageView.image = UIImage(systemName: "die.face.1")
        case 2:
            self.dice?.detailCount[2] += 1
            print(randomNumber, "이 나왔습니다")
            self.diceImageView.image = UIImage(systemName: "die.face.2")
        case 3:
            self.dice?.detailCount[3] += 1
            print(randomNumber, "이 나왔습니다")
            self.diceImageView.image = UIImage(systemName: "die.face.3")
        case 4:
            self.dice?.detailCount[4] += 1
            print(randomNumber, "이 나왔습니다")
            self.diceImageView.image = UIImage(systemName: "die.face.4")
        case 5:
            self.dice?.detailCount[5] += 1
            print(randomNumber, "이 나왔습니다")
            self.diceImageView.image = UIImage(systemName: "die.face.5")
        case 6:
            self.dice?.detailCount[6] += 1
            print(randomNumber, "이 나왔습니다")
            self.diceImageView.image = UIImage(systemName: "die.face.6")
        default:
            print("ERROR")
            return
        }
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.dice), forKey: "dice")
        
        print("----------------------------------------")
        print(getDataFromUserDefaults())
        print("----------------------------------------")
    }
}

// 데이터 전달
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        
        detailViewController.totalCount = self.dice?.totalCount
        detailViewController.detailCount = self.dice?.detailCount
    }
}

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var oneCount: UILabel!
    @IBOutlet weak var twoCount: UILabel!
    @IBOutlet weak var threeCount: UILabel!
    @IBOutlet weak var fourCount: UILabel!
    @IBOutlet weak var fiveCount: UILabel!
    @IBOutlet weak var sixCount: UILabel!
    
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var probabilityOfOne: UILabel!
    @IBOutlet weak var probabilityOfTwo: UILabel!
    @IBOutlet weak var probabilityOfThree: UILabel!
    @IBOutlet weak var probabilityOfFour: UILabel!
    @IBOutlet weak var probabilityOfFive: UILabel!
    @IBOutlet weak var probabilityOfSix: UILabel!
    
    var totalCount: Int?
    var detailCount: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barStyle = .black
        
        if let detailCount = detailCount,
           let totalCount = totalCount {
            self.totalCountLabel.text = "\(totalCount)회"
            
            self.probabilityOfOne.text = String(format: "%.5f", (Float(detailCount[1]) / Float(totalCount)))
            self.probabilityOfTwo.text = String(format: "%.5f", (Float(detailCount[2]) / Float(totalCount)))
            self.probabilityOfThree.text = String(format: "%.5f", (Float(detailCount[3]) / Float(totalCount)))
            self.probabilityOfFour.text = String(format: "%.5f", (Float(detailCount[4]) / Float(totalCount)))
            self.probabilityOfFive.text = String(format: "%.5f", (Float(detailCount[5]) / Float(totalCount)))
            self.probabilityOfSix.text = String(format: "%.5f", (Float(detailCount[6]) / Float(totalCount)))
            
            self.oneCount.text = "\(detailCount[1])번"
            self.twoCount.text = "\(detailCount[2])번"
            self.threeCount.text = "\(detailCount[3])번"
            self.fourCount.text = "\(detailCount[4])번"
            self.fiveCount.text = "\(detailCount[5])번"
            self.sixCount.text = "\(detailCount[6])번"
        }
    }

    @IBAction func tapClearButton(_ sender: UIButton) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(Dice(totalCount: 0, detailCount: [0, 0, 0, 0, 0, 0, 0])), forKey: "dice")
        
        self.navigationController?.popViewController(animated: true)
    }
}

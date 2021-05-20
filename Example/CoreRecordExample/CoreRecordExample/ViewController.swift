import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let playground = CoreRecordPlayground()
        playground.run(
            example: SimpleExample(),
            modelName: "CoreRecordExample"
        )
    }
}

class SimpleExample: CoreRecordExample {
    func run() {
        let person = Person.create(
            [
                "name": "Hugo",
                "birthday": Date(),
                "driverLicense": true
            ]
        ) as! Person
    }
}

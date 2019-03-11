import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    enum RecordState {
        case recording
        case notRecording
    }
    
    var audioRecorder: AVAudioRecorder!
    var recordingState: RecordState = .notRecording
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI(for: .notRecording)
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3492083902, green: 0.4501926694, blue: 0.535494351, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "Pitch Perfect"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }

    @IBAction func recordAudio(_ sender: Any) {
        if recordingState == .notRecording {
            recordingState = .recording
            configureUI(for: recordingState)
            startRecordSound()
        } else {
            recordingState = .notRecording
            configureUI(for: recordingState)
            stopRecordSound()
        }
    }
    
    func configureUI(for recordState: RecordState) {
        switch recordState {
        case .recording:
            recordingLabel.text = "Tap to finish recording"
            recordButton.setImage(UIImage(named: "Stop"), for: .normal)
        case .notRecording:
            recordingLabel.text = "Tap to start recording"
            recordButton.setImage(UIImage(named: "Record"), for: .normal)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let destination = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            destination.recordedAudioURL = recordedAudioURL
        }
    }
}



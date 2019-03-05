import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    enum RecordState {
        case recording
        case notRecording
    }
    
    var recordingState: RecordState = .notRecording
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            recordingLabel.text = "Tap to Finish Recording"
            recordButton.setImage(UIImage(named: "Stop"), for: .normal)
        case .notRecording:
            recordingLabel.text = "Tap to Start Recording"
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



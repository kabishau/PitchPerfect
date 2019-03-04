import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    enum RecordState {
        case recording, notRecording
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
    }

    @IBAction func recordAudio(_ sender: Any) {
        configureUI(.recording)
        startRecordSound()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        configureUI(.notRecording)
        stopRecordSound()
    }
    
    func configureUI(_ recordState: RecordState) {
        switch recordState {
        case .recording:
            recordingLabel.text = "Recording in Progress"
            stopRecordingButton.isEnabled = true
            recordButton.isEnabled = false
        case .notRecording:
            recordingLabel.text = "Tap to Record"
            stopRecordingButton.isEnabled = false
            recordButton.isEnabled = true
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



//
//  ViewController.swift
//  Phoner
//
//  Created by Omar Dlhz on 1/9/16.
//  Copyright © 2016 Omar De La Hoz. All rights reserved.
//

import Cocoa
import Foundation
import MultipeerConnectivity
import AVFoundation

class ViewController: NSViewController, MCSessionDelegate, MCNearbyServiceBrowserDelegate{
    
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var audioEngine: AVAudioEngine!
    var audioInputNode : AVAudioInputNode!
    var audioPlayerNode: AVAudioPlayerNode!
    var audioBuffer: AVAudioPCMBuffer!
    var serviceBrowser : MCNearbyServiceBrowser!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        peerID = MCPeerID(displayName: "Server")
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .Required)
        mcSession.delegate = self
        
        self.serviceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: "phoner")
        self.serviceBrowser.delegate = self
        self.serviceBrowser.startBrowsingForPeers()
        
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
        return
    }
    
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
        
        return
    }
    
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
        
        return
    }
    
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        
        print("\(peerID.displayName) changed state: \(state.toString())")

        
    }
    
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        
        return
    }
    
    func browser(browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        
        browser.invitePeer(peerID, toSession: self.mcSession, withContext: nil, timeout: 10)
    }
    
    func browser(browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: NSError) {
        return
    }
    
    func browser(browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        return
    }
    

}

extension MCSessionState {
    func toString() -> String {
        switch self {
        case .Connected:    return "Connected"
        case .Connecting:   return "Connecting"
        case .NotConnected: return "Not Connected"
        }
    }
}




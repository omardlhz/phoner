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

class ViewController: NSViewController, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate{
    
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    var audioEngine: AVAudioEngine!
    var audioInputNode : AVAudioInputNode!
    var audioPlayerNode: AVAudioPlayerNode!
    var audioBuffer: AVAudioPCMBuffer!
    var serviceAdvertiser : MCNearbyServiceAdvertiser!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        peerID = MCPeerID(displayName: "Server")
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .Required)
        mcSession.delegate = self
        
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "phoner")
        
        self.serviceAdvertiser.delegate = self
        self.serviceAdvertiser.startAdvertisingPeer()
        
        

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
        
        return
    }
    
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        
        return
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: NSError) {
        
        return
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: NSData?, invitationHandler: (Bool, MCSession) -> Void) {
        
        return
    }


}


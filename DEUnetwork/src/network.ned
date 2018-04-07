//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2015 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.examples.wireless.ratecontrol.Client;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.StandardHost;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.Eth10M;
import inet.node.inet.Router;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.node.inet.WirelessHost;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
//
// Model of the network, consisting of serveral clients, a server and a switch
//
network ClientServer
{
    parameters:
        int numClients = default(40);
        int numWiClients=default(10);
        @display("bgb=1247,1156");
    submodules:
        client[numClients]: StandardHost {
            parameters:
                @display("p=68,400,m,10,90");
        }
         area1AP: AccessPoint {
	            @display("p=200,50");
	        }
        configurator: IPv4NetworkConfigurator {
            @display("p=100,100");
        }
        switch0: EtherSwitch {
            @display("p=300,250");
        }
        router0: Router {
            @display("p=450,200");
        }
        wifiClient[numWiClients]: WirelessHost {
	            @display("p=600,90");
	        }
        visualizer: IntegratedCanvasVisualizer {
            @display("p=98.8575,209.81999");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
	            @display("p=150,30");
	        }
    connections:
        for i=0..numClients-1 {
            client[i].ethg++ <--> Eth100M <--> switch0.ethg++;
        }
        switch0.ethg++ <--> Eth100M <--> router0.ethg++;
        router0.ethg++ <--> Eth10M <--> area1AP.ethg++;

}



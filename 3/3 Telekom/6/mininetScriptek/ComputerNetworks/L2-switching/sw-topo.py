#!/usr/bin/python

from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSController
from mininet.node import CPULimitedHost, Host, Node
from mininet.nodelib import LinuxBridge
from mininet.node import IVSSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel, info
from mininet.link import TCLink, Intf
from subprocess import call
import sys

def myNetwork(pstp=0):

    net = Mininet( topo=None,
                   build=False,
                   ipBase='10.0.0.0/8')

    info( '*** Adding controller\n' )
    info( '*** Add switches\n')
    s5 = net.addSwitch('s5', cls=LinuxBridge, failMode='standalone', stp=pstp)
    s2 = net.addSwitch('s2', cls=LinuxBridge, failMode='standalone', stp=pstp)
    s7 = net.addSwitch('s7', cls=LinuxBridge, failMode='standalone', stp=pstp)
    s4 = net.addSwitch('s4', cls=LinuxBridge, failMode='standalone', stp=pstp)
    s6 = net.addSwitch('s6', cls=LinuxBridge, failMode='standalone', stp=pstp)
    s3 = net.addSwitch('s3', cls=LinuxBridge, failMode='standalone', stp=pstp)


    info( '*** Add hosts\n')
    h4 = net.addHost('h4', cls=Host, ip='11.0.0.4', defaultRoute=None)
    h4.cmd('sysctl -w -w net.ipv6.conf.default.disable_ipv6=1')
    h4.cmd('sysctl -w -w net.ipv6.conf.all.disable_ipv6=1')

    h1 = net.addHost('h1', cls=Host, ip='11.0.0.1', defaultRoute=None)
    h1.cmd('sysctl -w -w net.ipv6.conf.default.disable_ipv6=1')
    h1.cmd('sysctl -w -w net.ipv6.conf.all.disable_ipv6=1')

    h2 = net.addHost('h2', cls=Host, ip='11.0.0.2', defaultRoute=None)
    h2.cmd('sysctl -w -w net.ipv6.conf.default.disable_ipv6=1')
    h2.cmd('sysctl -w -w net.ipv6.conf.all.disable_ipv6=1')

    h3 = net.addHost('h3', cls=Host, ip='11.0.0.3', defaultRoute=None)
    h3.cmd('sysctl -w -w net.ipv6.conf.default.disable_ipv6=1')
    h3.cmd('sysctl -w -w net.ipv6.conf.all.disable_ipv6=1')

    info( '*** Add links\n')
    net.addLink(h3, s2)
    net.addLink(h4, s3)
    net.addLink(s3, s5)
    net.addLink(s2, s5)
    net.addLink(s5, s6)
    net.addLink(s4, s6)
    net.addLink(s4, s2)
    net.addLink(s2, s3)
    net.addLink(h1, s7)
    net.addLink(s7, h2)
    net.addLink(s7, s4)

    info( '*** Starting network\n')
    net.build()
    info( '*** Starting controllers\n')
    for controller in net.controllers:
        controller.start()

    info( '*** Starting switches\n')
    net.get('s5').start([])
    net.get('s2').start([])
    net.get('s7').start([])
    net.get('s4').start([])
    net.get('s6').start([])
    net.get('s3').start([])

    info( '*** Post configure switches and hosts\n')

    CLI(net)
    net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )

    pstp = 0
    if len(sys.argv)==2 and sys.argv[1]=="--stp":
	pstp = 1
	print("STP enabled")

    myNetwork(pstp)


#Kulprawee Prayoonsuk

#Note: this take about 3-5 minute to run 

# Creating New Simulator
set ns [new Simulator]


# Setting up the traces
set f [open out.tr w]
set nf [open out.nam w]
$ns namtrace-all $nf
$ns trace-all $f
proc finish {} { 
	global ns nf f
	$ns flush-trace
	puts "Simulation completed."
	close $nf
	close $f
	exit 0
}

#
# Create Nodes
# 

#This will create and print the ID of each node to the console:
set bot01 [$ns node]
      puts "bot01: [$bot01 id]"
set bot02 [$ns node]
      puts "bot02: [$bot02 id]"
set bot03 [$ns node]
      puts "bot03: [$bot03 id]"
set bot04 [$ns node]
      puts "bot04: [$bot04 id]"
set bot05 [$ns node]
      puts "bot05: [$bot05 id]"
set bot06 [$ns node]
      puts "bot06: [$bot06 id]"
set bot07 [$ns node]
      puts "bot07: [$bot07 id]"
set bot08 [$ns node]
      puts "bot08: [$bot08 id]"
set bot09 [$ns node]
      puts "bot09: [$bot09 id]"


set user01 [$ns node]
      puts "user01: [$user01 id]"
set user02 [$ns node]
      puts "user02: [$user02 id]"
set user03 [$ns node]
      puts "user03: [$user03 id]"	  
set user04 [$ns node]
      puts "user04: [$user04 id]"	  

	  
set router01 [$ns node]
      puts "router01: [$router01 id]"
set router02 [$ns node]
      puts "router02: [$router02 id]"
set router03 [$ns node]
      puts "router03: [$router03 id]"
set router04 [$ns node]
      puts "router04: [$router04 id]"
set router05 [$ns node]
      puts "router05: [$router05 id]"
set router06 [$ns node]
      puts "router06: [$router06 id]"
set router07 [$ns node]
      puts "router07: [$router07 id]"
set router08 [$ns node]
      puts "router08: [$router08 id]"
set router09 [$ns node]
      puts "router09: [$router09 id]"
set router10 [$ns node]
      puts "router10: [$router10 id]"
set router11 [$ns node]
      puts "router11: [$router11 id]"
set router12 [$ns node]
      puts "router12: [$router12 id]"
set router13 [$ns node]
      puts "router13: [$router13 id]"
set router14 [$ns node]
      puts "router14: [$router14 id]"
set router15 [$ns node]
      puts "router15: [$router15 id]"	  
set router16 [$ns node]
      puts "router16: [$router16 id]"

set decoy01 [$ns node]
      puts "decoy01: [$decoy01 id]"
set decoy02 [$ns node]
      puts "decoy02: [$decoy02 id]"
set decoy03 [$ns node]
      puts "decoy03: [$decoy03 id]"
	  
set WebServer [$ns node]
      puts "WebServer: [$WebServer id]"


#set shape of router node to be hexagon:
$router01 shape hexagon
$router02 shape hexagon
$router03 shape hexagon
$router04 shape hexagon
$router05 shape hexagon
$router06 shape hexagon
$router07 shape hexagon
$router08 shape hexagon
$router09 shape hexagon
$router10 shape hexagon
$router11 shape hexagon
$router12 shape hexagon
$router13 shape hexagon
$router14 shape hexagon
$router15 shape hexagon
$router16 shape hexagon

#label router nodes:
$router01 label "Router01"
$router02 label "Router02"
$router03 label "Router03"
$router04 label "Router04"
$router05 label "Router05"
$router06 label "Router06"
$router07 label "Router07"
$router08 label "Router08"
$router09 label "Router09"
$router10 label "Router10"
$router11 label "Router011"
$router12 label "Router012"
$router13 label "Router013"
$router14 label "Router014"
$router15 label "Router015"
$router16 label "Router016"

#set color of bot node to be red:
$bot01 color red
$bot02 color red
$bot03 color red
$bot04 color red
$bot05 color red
$bot06 color red
$bot07 color red
$bot08 color red
$bot09 color red

#label bot nodes:
$bot01 label "Bot1"
$bot02 label "Bot2"
$bot03 label "Bot3"
$bot04 label "Bot4"
$bot05 label "Bot5"
$bot06 label "Bot6"
$bot07 label "Bot7"
$bot08 label "Bot8"
$bot09 label "Bot9"

#set color of user node to be green:
$user01 color green
$user02 color green
$user03 color green
$user04 color green

#label users nodes:
$user01 label "User1"
$user02 label "User2"
$user03 label "User3"
$user04 label "User4"

#label webserver node
$WebServer label "Web Server"

#set color of user node to be yellow:
$decoy01 color yellow
$decoy02 color yellow
$decoy03 color yellow

#label decoy nodes:
$decoy01 label "Decoy1"
$decoy02 label "Decoy2"
$decoy03 label "Decoy3"

#
#Setup Connections
#

#The pair match the given topology diagram and set queue of all pair to 10
#each link have bandwidth = 1Mb and link delay of 10ms and droptail queuing strategy

$ns duplex-link $router09 $router16 1Mb 10ms DropTail
$ns queue-limit $router09 $router16 10

$ns duplex-link $router01 $router09 1Mb 10ms DropTail
$ns queue-limit $router01 $router09 10

$ns duplex-link $router09 $router02 1Mb 10ms DropTail
$ns queue-limit $router09 $router02 10

$ns duplex-link $router15 $router09 1Mb 10ms DropTail
$ns queue-limit $router15 $router09 10

$ns duplex-link $router04 $router03 1Mb 10ms DropTail
$ns queue-limit $router04 $router03 10

$ns duplex-link $router10 $router04 1Mb 10ms DropTail
$ns queue-limit $router10 $router04 10

$ns duplex-link $router14 $router10 1Mb 10ms DropTail
$ns queue-limit $router14 $router10 10

$ns duplex-link $router05 $router14 1Mb 10ms DropTail
$ns queue-limit $router05 $router14 10

$ns duplex-link $router11 $router06 1Mb 10ms DropTail
$ns queue-limit $router11 $router06 10

$ns duplex-link $router08 $router12 1Mb 10ms DropTail
$ns queue-limit $router08 $router12 10

$ns duplex-link $router11 $router12 1Mb 10ms DropTail
$ns queue-limit $router11 $router12 10

$ns duplex-link $bot01 $router01 1Mb 10ms DropTail
$ns queue-limit $bot01 $router01 10

$ns duplex-link $router16 $bot09 1Mb 10ms DropTail
$ns queue-limit $router16 $bot09 10

$ns duplex-link $router14 $router13 1Mb 10ms DropTail
$ns queue-limit $router14 $router13 10

$ns duplex-link $decoy01 $router13 1Mb 10ms DropTail
$ns queue-limit $decoy01 $router13 10

$ns duplex-link $router13 $router15 1Mb 10ms DropTail
$ns queue-limit $router13 $router15 10

$ns duplex-link $router15 $router11 1Mb 10ms DropTail
$ns queue-limit $router15 $router11 10

$ns duplex-link $router15 $WebServer 1Mb 10ms DropTail
$ns queue-limit $router15 $WebServer 10

$ns duplex-link $user01 $router01 1Mb 10ms DropTail
$ns queue-limit $user01 $router01 10

$ns duplex-link $bot02 $router02 1Mb 10ms DropTail
$ns queue-limit $bot02 $router02 10

$ns duplex-link $bot04 $router04 1Mb 10ms DropTail
$ns queue-limit $bot04 $router04 10

$ns duplex-link $user02 $router04 1Mb 10ms DropTail
$ns queue-limit $user02 $router04 10

$ns duplex-link $user03 $router05 1Mb 10ms DropTail
$ns queue-limit $user03 $router05 10

$ns duplex-link $bot06 $router06 1Mb 10ms DropTail
$ns queue-limit $bot06 $router06 10

$ns duplex-link $bot08 $router08 1Mb 10ms DropTail
$ns queue-limit $bot08 $router08 10

$ns duplex-link $router09 $router13 1Mb 10ms DropTail
$ns queue-limit $router09 $router13 10

$ns duplex-link $router15 $decoy02 1Mb 10ms DropTail
$ns queue-limit $router15 $decoy02 10

$ns duplex-link $router03 $bot03 1Mb 10ms DropTail
$ns queue-limit $router03 $bot03 10

$ns duplex-link $bot05 $router05 1Mb 10ms DropTail
$ns queue-limit $bot05 $router05 10

$ns duplex-link $bot07 $router07 1Mb 10ms DropTail
$ns queue-limit $bot07 $router07 10

$ns duplex-link $router15 $decoy03 1Mb 10ms DropTail
$ns queue-limit $router15 $decoy03 10

$ns duplex-link $router11 $router07 1Mb 10ms DropTail
$ns queue-limit $router11 $router07 10

$ns duplex-link $user04 $router07 1Mb 10ms DropTail
$ns queue-limit $user04 $router07 10


#
#Set up Transportation Level Connections
#

#TCP connection component:---------------------------
set log0 [open "http0.log" w]
set pgp0 [new PagePool/Math]

set tmps0 [new RandomVariable/Constant]
$tmps0 set val_ 1024
$pgp0 ranvar-size $tmps0
set tmps0 [new RandomVariable/Exponential]
$tmps0 set avg_ 0.5
$pgp0 ranvar-age $tmps0

set WServer0 [new Http/Server $ns $WebServer]
$WServer0 set-page-generator $pgp0
$WServer0 log $log0

set WClient1 [new Http/Client $ns $user02 ]
set tmpc4 [new RandomVariable/Exponential]
$tmpc4 set avg_ 0.5
$WClient1 set-interval-generator $tmpc4
$WClient1 set-page-generator $pgp0
$WClient1 log $log0

set WClient2 [new Http/Client $ns $user03 ]
set tmpc4 [new RandomVariable/Exponential]
$tmpc4 set avg_ 0.5
$WClient2 set-interval-generator $tmpc4
$WClient2 set-page-generator $pgp0
$WClient2 log $log0

set WClient3 [new Http/Client $ns $user04 ]
set tmpc4 [new RandomVariable/Exponential]
$tmpc4 set avg_ 0.5
$WClient3 set-interval-generator $tmpc4
$WClient3 set-page-generator $pgp0
$WClient3 log $log0

set WClient0 [new Http/Client $ns $user01]
set tmpc4 [new RandomVariable/Exponential]
$tmpc4 set avg_ 0.5
$WClient0 set-interval-generator $tmpc4
$WClient0 set-page-generator $pgp0
$WClient0 log $log0

#End of TCP connection component:---------------------------

#set udp to each bot, user and decoy:
set udp1 [new Agent/UDP]
    $udp1 set dst_addr_ Unicast
$ns attach-agent $bot01 $udp1

set udp2 [new Agent/UDP]
$ns attach-agent $bot09 $udp2

set udp3 [new Agent/UDP]
$ns attach-agent $bot02 $udp3

set udp4 [new Agent/UDP]
$ns attach-agent $bot03 $udp4

set udp5 [new Agent/UDP]
$ns attach-agent $bot04 $udp5

set udp6 [new Agent/UDP]
$ns attach-agent $bot05 $udp6

set udp10 [new Agent/UDP]
$ns attach-agent $user01 $udp10

set udp11 [new Agent/UDP]
$ns attach-agent $user02 $udp11

set udp12 [new Agent/UDP]
$ns attach-agent $user03 $udp12

set udp7 [new Agent/UDP]
$ns attach-agent $bot06 $udp7

set udp8 [new Agent/UDP]
$ns attach-agent $bot07 $udp8

set udp13 [new Agent/UDP]
$ns attach-agent $user04 $udp13

set udp9 [new Agent/UDP]
$ns attach-agent $bot08 $udp9

#Null represent each decoy:
set null0 [new Agent/Null]
$ns attach-agent $decoy01 $null0

set null2 [new Agent/Null]
$ns attach-agent $decoy03 $null2

set null1 [new Agent/Null]
$ns attach-agent $decoy02 $null1


#
#Setup traffic sources
#

#[Variable]: change the traffic rate of each bot here [Variable]

set cbr6 [new Application/Traffic/CBR]
    $cbr6 set rate_ 524kbps
$cbr6 attach-agent $udp3

set cbr5 [new Application/Traffic/CBR]
    $cbr5 set rate_ 524kbps
$cbr5 attach-agent $udp2

set cbr9 [new Application/Traffic/CBR]
    $cbr9 set rate_ 524kbps
$cbr9 attach-agent $udp6

set cbr7 [new Application/Traffic/CBR]
    $cbr7 set rate_ 524kbps
$cbr7 attach-agent $udp4

set cbr8 [new Application/Traffic/CBR]
    $cbr8 set rate_ 524kbps
$cbr8 attach-agent $udp5

set cbr10 [new Application/Traffic/CBR]
    $cbr10 set rate_ 524kbps
$cbr10 attach-agent $udp7

set cbr11 [new Application/Traffic/CBR]
    $cbr11 set rate_ 524kbps
$cbr11 attach-agent $udp8

set cbr12 [new Application/Traffic/CBR]
    $cbr12 set rate_ 524kbps
$cbr12 attach-agent $udp9

set cbr4 [new Application/Traffic/CBR]
    $cbr4 set rate_ 524kbps
$cbr4 attach-agent $udp1

set cbr13 [new Application/Traffic/CBR]
    $cbr13 set rate_ 4kbps
$cbr13 attach-agent $udp10

set cbr14 [new Application/Traffic/CBR]
    $cbr14 set rate_ 4kbps
$cbr14 attach-agent $udp11

set cbr15 [new Application/Traffic/CBR]
    $cbr15 set rate_ 4kbps
$cbr15 attach-agent $udp12

set cbr16 [new Application/Traffic/CBR]
    $cbr16 set rate_ 4kbps
$cbr16 attach-agent $udp13

$ns color 9 Red

#set traffic color of all bot to red

#[Variable]: Change which bot talk to which decoy here [Variable]
$ns connect $udp9 $null0
$udp9 set fid_ 9
$ns connect $udp8 $null0
$udp8 set fid_ 9
$ns connect $udp7 $null0
$udp7 set fid_ 9
$ns connect $udp2 $null1
$udp2 set fid_ 9
$ns connect $udp1 $null1
$udp1 set fid_ 9
$ns connect $udp3 $null1
$udp3 set fid_ 9
$ns connect $udp4 $null2
$udp4 set fid_ 9
$ns connect $udp5 $null2
$udp5 set fid_ 9
$ns connect $udp6 $null2
$udp6 set fid_ 9

#
#Start up the sources
#

#start traffic generator at time = 0.1 sec:
$ns at 0.1 "$cbr4 start"
$ns at 0.1 "$cbr5 start"
$ns at 0.1 "$cbr6 start"
$ns at 0.1 "$cbr7 start"
$ns at 0.1 "$cbr8 start"
$ns at 0.1 "$cbr9 start"
$ns at 0.1 "$cbr10 start"
$ns at 0.1 "$cbr11 start"
$ns at 0.1 "$cbr12 start"


$ns at 0.0 "start-connection0"

#start the webserver tcp
proc start-connection0 {} { 
    global ns WClient0 WServer0
    $WClient0 connect $WServer0
    $WClient0 start-session $WServer0 $WServer0
}


$ns at 0.1 "start-connection1"

proc start-connection1 {} { 
    global ns WClient1 WServer0
    $WClient1 connect $WServer0
    $WClient1 start-session $WServer0 $WServer0
}


$ns at 0.2 "start-connection2"

proc start-connection2 {} { 
    global ns WClient2 WServer0
    $WClient2 connect $WServer0
    $WClient2 start-session $WServer0 $WServer0
}


$ns at 0.3 "start-connection3"

proc start-connection3 {} { 
    global ns WClient3 WServer0
    $WClient3 connect $WServer0
    $WClient3 start-session $WServer0 $WServer0
}

#end simulation at 5 second
$ns at 5.0 "finish"
$ns run

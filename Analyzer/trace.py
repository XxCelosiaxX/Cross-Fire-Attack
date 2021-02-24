'''
This code is to get the number of packet drop from the network
This following information will be given:
	- number of all packet alive in the network in each second
	- number of all packet drop in the network in each second 
	- total network degradation rate (degradation rate = # packet drop / # packet sent)
	- degradation rate of user packet per second
	- total degradation rate of user packet during simulation
'''
sbsp = []
sbsd = []

sbspc = 0
sbsdc = 0
second = 1

total_packets = 0
total_dropped = 0

user0id = 9    #node id of user1 [if you change your node id these must also change]
user0 = 0
user0d = 0
user0pid = []
user0drate = []

user1id = 10   #node id of user2 [if you change your node id these must also change]
user1 = 0
user1d = 0
user1pid = []
user1drate = []

user2id = 11  #node id of user3 [if you change your node id these must also change]
user2 = 0
user2d = 0
user2pid = []
user2drate = []

user3id = 12  #node id of user4 [if you change your node id these must also change]
user3 = 0
user3d = 0
user3pid = []
user3drate = []

uniquepackets = []

trfile = open("out.tr", "r") #if your .tr file is name differently change it here 

for line in trfile:    
    line = line.split()
    
    if float(line[1]) - second >= 0:
        second += 1
        sbsp.append(sbspc)
        sbsd.append(sbsdc)
        sbspc = 0
        sbsdc = 0
        user0drate.append("{}/{}".format(user0d, user0))
        user1drate.append("{}/{}".format(user1d, user1))
        user2drate.append("{}/{}".format(user2d, user2))
        user3drate.append("{}/{}".format(user3d, user3))
        
    if len(line) != 12:
        print(line)
        continue
    
    if line[11] not in uniquepackets:
        uniquepackets.append(line[11])
        total_packets += 1
        sbspc += 1
    
    if line[0] == 'd':
        total_dropped += 1
        sbsdc += 1
        if line[11] in user0pid:
            user0d += 1
        if line[11] in user1pid:
            user1d += 1
        if line[11] in user2pid:
            user2d += 1
        if line[11] in user3pid:
            user3d += 1
    
    if line[2] == str(user0id) and line[0] == '+':
        user0 += 1
        user0pid.append(line[11])
    
    if line[2] == str(user1id) and line[0] == '+':
        user1 += 1
        user1pid.append(line[11])
    
    if line[2] == str(user2id) and line[0] == '+':
        user2 += 1
        user2pid.append(line[11])
    
    if line[2] == str(user3id) and line[0] == '+':
        user3 += 1
        user3pid.append(line[11])
sbsp.append(sbspc)
sbsd.append(sbsdc)
user0drate.append("{}/{}".format(user0d, user0))
user1drate.append("{}/{}".format(user1d, user1))
user2drate.append("{}/{}".format(user2d, user2))
user3drate.append("{}/{}".format(user3d, user3))


print("Degradation per Second")
print("Packets Per Second Alive: {}".format(sbsp))
print("Packets Per Second Dropped: {}".format(sbsd))
print()

print("Total Degradation")
print("{} / {}".format(total_dropped, total_packets))
print()

print("User Degradation per Second")
print("User 0 Rate: {}".format(user0drate))
print("User 1 Rate: {}".format(user1drate))
print("User 2 Rate: {}".format(user2drate))
print("User 3 Rate: {}".format(user3drate))
print()

print("Total User Degradation")
print("User 0 Packets: {} / {}".format(user0d, user0))
print("User 1 Packets: {} / {}".format(user1d, user1))
print("User 2 Packets: {} / {}".format(user2d, user2))
print("User 3 Packets: {} / {}".format(user3d, user3))
print()
